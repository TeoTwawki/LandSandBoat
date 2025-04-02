-----------------------------------
-- Area: Buburimu Peninsula
--  Mob: Bull Dhalmel
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 34, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 35, 2, invaderXim.regime.type.FIELDS)
end

return entity
