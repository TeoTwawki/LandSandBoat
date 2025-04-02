-----------------------------------
-- Area: South Gustaberg
--  Mob: Walking Sapling
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 78, 2, invaderXim.regime.type.FIELDS)
end

return entity
