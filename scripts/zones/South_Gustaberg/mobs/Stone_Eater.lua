-----------------------------------
-- Area: South Gustaberg
--  Mob: Stone Eater
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 77, 1, invaderXim.regime.type.FIELDS)
end

return entity
