-----------------------------------
--  MOB: Vanilla Custard
-- Area: Nyzul Isle
-- Info: Enemy Leader, Absorbs dark elemental damage
-----------------------------------
mixins = { require('scripts/mixins/families/flan') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(invaderXim.mod.DARK_ABSORB, 100)
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        invaderXim.nyzul.spawnChest(mob, player)
        invaderXim.nyzul.enemyLeaderKill(mob)
    end
end

return entity
