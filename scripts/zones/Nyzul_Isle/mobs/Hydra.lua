-----------------------------------
--  MOB: Hydra
-- Area: Nyzul Isle
-- Info: Floor 60 80 and 100 Boss
-----------------------------------
mixins = { require('scripts/mixins/nyzul_boss_drops') }
-----------------------------------
---@type TMobEntity
local entity = {}

local function handleRegen(mob, broken)
    local multiplier = (2 - broken) * 0.75
    mob:setMod(invaderXim.mod.REGEN, math.floor(25 * multiplier))
    mob:setMod(invaderXim.mod.REGAIN, math.floor(25 * multiplier))
end

entity.onMobInitialize = function(mob)
    -- Set Immunities.
    -- mob:addImmunity(invaderXim.immunity.GRAVITY)
    -- mob:addImmunity(invaderXim.immunity.BIND)
    -- mob:addImmunity(invaderXim.immunity.PARALYZE)
end

entity.onMobSpawn = function(mob)
    mob:setMod(invaderXim.mod.DOUBLE_ATTACK, 10)
    mob:setMod(invaderXim.mod.UDMGMAGIC, -9000)
    mob:setMod(invaderXim.mod.POISON_MEVA, 100)
    mob:setMod(invaderXim.mod.BLIND_MEVA, 100)
    mob:setMod(invaderXim.mod.SILENCE_MEVA, 100)
    mob:setMod(invaderXim.mod.SLOW_MEVA, 100)
    mob:setMod(invaderXim.mod.STUN_MEVA, 175)
    mob:setMod(invaderXim.mod.SLEEP_MEVA, 150)
    mob:setMod(invaderXim.mod.DEFP, 35)
    mob:addMod(invaderXim.mod.EVA, 15)
    mob:setMod(invaderXim.mod.MAIN_DMG_RATING, 40)

    mob:setMobMod(invaderXim.mobMod.ROAM_DISTANCE, 15)
end

entity.onMobEngage = function(mob)
    handleRegen(mob, mob:getAnimationSub())
end

entity.onMobFight = function(mob, target)
    local battletime = os.time()
    local headgrow   = mob:getLocalVar('headgrow')
    local broken     = mob:getAnimationSub()

    if headgrow < battletime and broken > 0 then
        mob:setAnimationSub(broken - 1)
        mob:setLocalVar('headgrow', battletime + 300)
        mob:setTP(3000)
        handleRegen(mob, broken - 1)
    end
end

entity.onCriticalHit = function(mob)
    local rand   = math.random(1, 100)
    local broken = mob:getAnimationSub()

    if rand <= 15 and broken < 2 then
        mob:setAnimationSub(broken + 1)
        mob:setLocalVar('headgrow', os.time() + math.random(120, 240))
        handleRegen(mob, broken + 1)
    end
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        invaderXim.nyzul.enemyLeaderKill(mob)
        invaderXim.nyzul.vigilWeaponDrop(player, mob)
        invaderXim.nyzul.handleRunicKey(mob)
    end
end

return entity
