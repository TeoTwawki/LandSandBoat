-----------------------------------
-- Area: La Theine Plateau
--  Mob: Coral Crab
-----------------------------------
require('scripts/quests/tutorial')
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 70, 2, invaderXim.regime.type.FIELDS)
    invaderXim.tutorial.onMobDeath(player)
end

return entity
