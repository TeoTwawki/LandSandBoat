-----------------------------------
-- Area: Konschtat Highlands
--  Mob: Mist Lizard
-----------------------------------
require('scripts/quests/tutorial')
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 20, 2, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 82, 2, invaderXim.regime.type.FIELDS)
    invaderXim.tutorial.onMobDeath(player)
end

return entity
