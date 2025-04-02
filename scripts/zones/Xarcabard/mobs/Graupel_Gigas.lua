-----------------------------------
-- Area: Xarcabard
--  Mob: Graupel Gigas
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 54, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 55, 2, invaderXim.regime.type.FIELDS)
end

return entity
