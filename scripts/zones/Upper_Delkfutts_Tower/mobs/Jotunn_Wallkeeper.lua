-----------------------------------
-- Area: Upper Delkfutt's Tower
--  Mob: Jotunn Wallkeeper
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 786, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 789, 2, invaderXim.regime.type.GROUNDS)
end

return entity
