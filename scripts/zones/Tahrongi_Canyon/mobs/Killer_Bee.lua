-----------------------------------
-- Area: Tahrongi Canyon
--  Mob: Killer Bee
-----------------------------------
require('scripts/quests/tutorial')
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 30, 2, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 95, 2, invaderXim.regime.type.FIELDS)
    invaderXim.tutorial.onMobDeath(player)
end

return entity
