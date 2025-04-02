-----------------------------------
-- Area: Quicksand Caves
--  Mob: Sand Spider
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 812, 1, invaderXim.regime.type.GROUNDS)
end

return entity
