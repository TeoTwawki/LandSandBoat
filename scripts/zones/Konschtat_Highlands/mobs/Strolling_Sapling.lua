-----------------------------------
-- Area: Konschtat Highlands
--  Mob: Strolling Sapling
-----------------------------------
require('scripts/quests/tutorial')
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 81, 1, invaderXim.regime.type.FIELDS)
    invaderXim.tutorial.onMobDeath(player)
end

return entity
