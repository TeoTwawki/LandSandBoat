-----------------------------------
-- Area: Buburimu Peninsula
--  Mob: Sylvestre
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 32, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 33, 2, invaderXim.regime.type.FIELDS)
end

return entity
