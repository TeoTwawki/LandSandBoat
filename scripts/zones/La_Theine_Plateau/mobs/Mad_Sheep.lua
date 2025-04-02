-----------------------------------
-- Area: La Theine Plateau
--  Mob: Mad Sheep
-----------------------------------
require('scripts/quests/tutorial')
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 69, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 70, 1, invaderXim.regime.type.FIELDS)
    invaderXim.tutorial.onMobDeath(player)
end

return entity
