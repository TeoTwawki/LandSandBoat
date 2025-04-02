-----------------------------------
--  MOB: Behemoth
-- Area: Nyzul Isle
-- Info: Floor 20 and 40 Boss
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
    mob:setMod(invaderXim.mod.MAIN_DMG_RATING, 42)
    mob:addMod(invaderXim.mod.ATT, 150)

    mob:setMobMod(invaderXim.mobMod.ROAM_DISTANCE, 15)
end

entity.onMobEngage = function(mob, target)
end

entity.onMobFight = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        invaderXim.nyzul.enemyLeaderKill(mob)
        invaderXim.nyzul.vigilWeaponDrop(player, mob)
    end
end

return entity
