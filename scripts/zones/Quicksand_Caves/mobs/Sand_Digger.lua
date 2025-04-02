-----------------------------------
-- Area: Quicksand Caves
--  Mob: Sand Digger
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 814, 1, invaderXim.regime.type.GROUNDS)
end

return entity
