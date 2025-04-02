-----------------------------------
-- Area: Quicksand Caves
--  Mob: Sand Tarantula
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 819, 1, invaderXim.regime.type.GROUNDS)
end

return entity
