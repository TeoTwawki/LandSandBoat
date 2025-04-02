-----------------------------------
-- Area: Sealions Den
--  Mob: Omega
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.EXP_BONUS, -100)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, -1)
end

entity.onMobSpawn = function(mob)
    mob:setBehavior(bit.bor(mob:getBehavior(), invaderXim.behavior.NO_TURN))
    mob:setMod(invaderXim.mod.REGAIN, 100)
    mob:setMobMod(invaderXim.mobMod.SKILL_LIST, 54)
end

entity.onMobFight = function(mob)
    -- Gains regain at under 25% HP
    local stage = mob:getLocalVar('stage')

    if mob:getHPP() < 60 and stage == 0 then
        mob:setDelay(3000)
        mob:setMod(invaderXim.mod.REGAIN, 150)
        mob:setLocalVar('stage', 1)
    elseif mob:getHPP() < 25 and stage < 2 then
        mob:setDelay(2500)
        mob:setMod(invaderXim.mod.REGAIN, 200)
        mob:setMobMod(invaderXim.mobMod.SKILL_LIST, 1187)
        mob:setLocalVar('stage', 2)
    end
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.STUN)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
