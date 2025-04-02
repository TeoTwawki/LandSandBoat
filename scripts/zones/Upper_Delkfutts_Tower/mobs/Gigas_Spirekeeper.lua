-----------------------------------
-- Area: Upper Delkfutt's Tower
--  Mob: Gigas Spirekeeper
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 785, 1, invaderXim.regime.type.GROUNDS)
end

return entity
