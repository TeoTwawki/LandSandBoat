-----------------------------------
-- Area: North Gustaberg
--  Mob: Stone Eater
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 16, 1, invaderXim.regime.type.FIELDS)
end

return entity
