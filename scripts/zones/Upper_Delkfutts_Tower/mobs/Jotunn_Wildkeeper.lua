-----------------------------------
-- Area: Upper Delkfutt's Tower
--  Mob: Jotunn Wildkeeper
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 787, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 789, 1, invaderXim.regime.type.GROUNDS)
end

return entity
