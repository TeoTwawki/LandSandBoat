-----------------------------------
--  MOB: Adamantoise
-- Area: Nyzul Isle
-- Info: Floor 20 and 40 Boss, Tortoise song dispels 3 buffs
-----------------------------------
mixins = { require('scripts/mixins/nyzul_boss_drops') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    -- Set Immunities.
    -- mob:addImmunity(invaderXim.immunity.STUN)
    -- mob:addImmunity(invaderXim.immunity.SLOW)
    -- mob:addImmunity(invaderXim.immunity.POISON)
    -- mob:addImmunity(invaderXim.immunity.ELEGY)
    -- mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    -- mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    -- mob:addImmunity(invaderXim.immunity.TERROR)
end

entity.onMobSpawn = function(mob)
    mob:setMod(invaderXim.mod.MAIN_DMG_RATING, 36)
    mob:addMod(invaderXim.mod.DEF, 200)
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
