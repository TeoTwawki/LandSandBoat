-----------------------------------
--  MOB: Khimaira
-- Area: Nyzul Isle
-- Info : Floor 60 80 100 Boss
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
    mob:setMod(invaderXim.mod.MEVA, 25)
    mob:setMod(invaderXim.mod.MAIN_DMG_RATING, 33)
    mob:setMod(invaderXim.mod.DOUBLE_ATTACK, 15)
    mob:addMod(invaderXim.mod.ATT, 100)
    -- TODO: mob:addResist({ invaderXim.resist.ENFEEBLING_STUN, 10, 0 })
    mob:setMobMod(invaderXim.mobMod.ROAM_DISTANCE, 15)
end

entity.onMobFight = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        invaderXim.nyzul.enemyLeaderKill(mob)
        invaderXim.nyzul.vigilWeaponDrop(player, mob)
        invaderXim.nyzul.handleRunicKey(mob)
    end
end

return entity
