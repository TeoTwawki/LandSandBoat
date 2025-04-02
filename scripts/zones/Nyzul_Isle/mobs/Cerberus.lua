-----------------------------------
--  MOB: Cerberus
-- Area: Nyzul Isle
-- Info: Floor 60 80 and 100 Boss
-----------------------------------
mixins = { require('scripts/mixins/nyzul_boss_drops') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    -- Set Immunities.
    -- mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    -- mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    -- mob:addImmunity(invaderXim.immunity.TERROR)
end

entity.onMobSpawn = function(mob)
    mob:setMod(invaderXim.mod.DOUBLE_ATTACK, 20)
    mob:setMod(invaderXim.mod.REGEN, 10) -- validate
    -- mdt already set in mob family mods
    mob:setMod(invaderXim.mod.POISON_MEVA, 100)
    mob:setMod(invaderXim.mod.PARALYZE_MEVA, 100)
    mob:setMod(invaderXim.mod.BLIND_MEVA, 100)
    mob:setMod(invaderXim.mod.SILENCE_MEVA, 100)
    mob:setMod(invaderXim.mod.SLOW_MEVA, 125)
    mob:addMod(invaderXim.mod.ATT, 75)
    mob:setMod(invaderXim.mod.DEFP, 48)
    mob:setMod(invaderXim.mod.MAIN_DMG_RATING, 40)

    mob:setMobMod(invaderXim.mobMod.ROAM_DISTANCE, 15)
end

entity.onMobFight = function(mob, target)
    if mob:getHPP() > 25 then
        mob:setMod(invaderXim.mod.REGAIN, 10)
    else
        mob:setMod(invaderXim.mod.REGAIN, 70)
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
