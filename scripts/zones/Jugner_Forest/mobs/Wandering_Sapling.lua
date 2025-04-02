-----------------------------------
-- Area: Jugner Forest
--  Mob: Wandering Sapling
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 58, 1, invaderXim.regime.type.FIELDS)
end

return entity
