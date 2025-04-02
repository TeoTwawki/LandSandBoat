-----------------------------------
-- Area: Middle Delkfutt's Tower
--  Mob: Gigas Jailer
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 783, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 784, 2, invaderXim.regime.type.GROUNDS)
end

return entity
