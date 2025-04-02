-----------------------------------
--  MOB: Black Pudding
-- Area: Nyzul Isle
-----------------------------------
mixins = { require('scripts/mixins/families/flan') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    invaderXim.nyzul.specifiedEnemySet(mob)
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        invaderXim.nyzul.spawnChest(mob, player)
        invaderXim.nyzul.specifiedEnemyKill(mob)
    end
end

return entity
