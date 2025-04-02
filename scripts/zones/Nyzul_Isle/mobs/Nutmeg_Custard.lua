-----------------------------------
--  MOB: Nutmeg Custard
-- Area: Nyzul Isle
-- Info: Enemy Leader, Absorbs earth elemental damage
-----------------------------------
mixins = { require('scripts/mixins/families/flan') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setMod(invaderXim.mod.EARTH_ABSORB, 100)
    mob:setMod(invaderXim.mod.REGAIN, 100)
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        invaderXim.nyzul.spawnChest(mob, player)
        invaderXim.nyzul.enemyLeaderKill(mob)
    end
end

return entity
