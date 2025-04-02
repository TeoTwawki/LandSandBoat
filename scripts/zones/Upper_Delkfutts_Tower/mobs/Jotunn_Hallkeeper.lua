-----------------------------------
-- Area: Upper Delkfutt's Tower
--  Mob: Jotunn Hallkeeper
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 787, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 788, 2, invaderXim.regime.type.GROUNDS)
end

return entity
