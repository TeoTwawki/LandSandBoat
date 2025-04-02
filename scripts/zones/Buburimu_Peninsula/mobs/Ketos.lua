-----------------------------------
-- Area: Buburimu Peninsula
--  Mob: Ketos
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 62, 1, invaderXim.regime.type.FIELDS)
end

return entity
