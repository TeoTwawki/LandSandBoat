-----------------------------------
-- Area: Upper Delkfutt's Tower
--  Mob: Incubus Bats
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 786, 3, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 787, 3, invaderXim.regime.type.GROUNDS)
end

return entity
