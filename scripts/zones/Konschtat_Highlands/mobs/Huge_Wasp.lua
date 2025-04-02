-----------------------------------
-- Area: Konschtat Highlands
--  Mob: Huge Wasp
-----------------------------------
require('scripts/quests/tutorial')
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 81, 2, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 82, 1, invaderXim.regime.type.FIELDS)
    invaderXim.tutorial.onMobDeath(player)
end

return entity
