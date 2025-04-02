-----------------------------------
-- Area: North Gustaberg
--  Mob: Amber Quadav
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 19, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 59, 1, invaderXim.regime.type.FIELDS)
end

return entity
