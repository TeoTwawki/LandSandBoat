-----------------------------------
-- Area: La Theine Plateau
--  Mob: Akbaba
-----------------------------------
require('scripts/quests/tutorial')
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 69, 2, invaderXim.regime.type.FIELDS)
    invaderXim.tutorial.onMobDeath(player)
end

return entity
