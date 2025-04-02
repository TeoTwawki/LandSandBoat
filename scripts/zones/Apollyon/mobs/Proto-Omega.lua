-----------------------------------
-- Area: Apollyon (Central)
--  Mob: Proto-Omega
-----------------------------------
---@type TMobEntity
local entity = {}

local quadrupedForm = function(mob)
    mob:setAnimationSub(1)
    mob:setMod(invaderXim.mod.ATTP, 100)
    mob:setMod(invaderXim.mod.UDMGPHYS, -9000)
    mob:setMod(invaderXim.mod.UDMGRANGE, -9000)
    mob:setMod(invaderXim.mod.UDMGMAGIC, -3000)
    mob:setMobMod(invaderXim.mobMod.SKILL_LIST, 727)
end

local bipedForm = function(mob)
    mob:setAnimationSub(2)
    mob:setMod(invaderXim.mod.ATTP, 200)
    mob:setMod(invaderXim.mod.UDMGPHYS, -3000)
    mob:setMod(invaderXim.mod.UDMGRANGE, -3000)
    mob:setMod(invaderXim.mod.UDMGMAGIC, -9000)
    mob:setMobMod(invaderXim.mobMod.SKILL_LIST, 1188)
end

local finalForm = function(mob)
    mob:setLocalVar('final', 1)
    mob:setAnimationSub(2)
    mob:setMod(invaderXim.mod.ATTP, 250)
    mob:setMod(invaderXim.mod.UDMGPHYS, -5000)
    mob:setMod(invaderXim.mod.UDMGRANGE, -5000)
    mob:setMod(invaderXim.mod.UDMGMAGIC, -5000)
    mob:setMod(invaderXim.mod.REGAIN, 100)
    mob:setMobMod(invaderXim.mobMod.SKILL_LIST, 1189)
end

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(invaderXim.mobMod.SOUND_RANGE, 25)
    mob:addImmunity(invaderXim.immunity.GRAVITY)
    mob:addImmunity(invaderXim.immunity.BIND)
    mob:addImmunity(invaderXim.immunity.SILENCE)
    mob:addImmunity(invaderXim.immunity.BLIND)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.TERROR)
end

entity.onMobSpawn = function(mob)
    mob:setMobMod(invaderXim.mobMod.CANNOT_GUARD, 1)
    mob:setMod(invaderXim.mod.COUNTER, 10)
    mob:setMod(invaderXim.mod.REGAIN, 50)
    mob:setMod(invaderXim.mod.REGEN, 25)
    mob:setBehavior(bit.bor(mob:getBehavior(), invaderXim.behavior.NO_TURN))
    -- base speed of 60 is based on retail capture and applies to all forms
    -- also has standard boost (2.5x) up to 150 when target is out of range
    mob:setBaseSpeed(60)
    quadrupedForm(mob)
end

entity.onMobEngage = function(mob, target)
    mob:setLocalVar('formTime', os.time() + 120)
end

entity.onMobFight = function(mob, target)
    local now = os.time()

    -- If in Final form then do Pod Ejection every 5 minutes
    if mob:getLocalVar('final') == 1 then
        if
            now >= mob:getLocalVar('gunpodTime') and
            mob:getCurrentAction() == invaderXim.act.ATTACK and
            GetMobByID(mob:getID() + 1):getStatus() == invaderXim.status.DISAPPEAR
        then
            mob:setLocalVar('gunpodTime', now + utils.minutes(5))
            mob:useMobAbility(1532) -- Pod Ejection
        end

        return
    end

    -- Convert into final form at 25% HP
    if mob:getHPP() <= 25 then
        finalForm(mob)
        return
    end

    -- Swap between forms every 2 minutes
    local form = mob:getLocalVar('formTime')
    if now >= form and mob:getCurrentAction() == invaderXim.act.ATTACK then
        mob:setLocalVar('formTime', now + utils.minutes(2))
        if mob:getAnimationSub() == 1 then
            bipedForm(mob)

            -- Wait for 4.5s while changing form and then do Pod Ejection
            mob:wait(4500)
            mob:timer(4500, function(mobArg)
                if mob:isAlive() and mob:getLocalVar('initialGunpod') == 0 then
                    mob:setLocalVar('initialGunpod', 1)
                    mob:useMobAbility(1532) -- Pod Ejection
                end
            end)
        else
            quadrupedForm(mob)
            mob:wait(4500)
        end
    end
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.STUN)
end

entity.onMobDeath = function(mob, player, optParams)
    if player then
        player:addTitle(invaderXim.title.APOLLYON_RAVAGER)
    end
end

return entity
