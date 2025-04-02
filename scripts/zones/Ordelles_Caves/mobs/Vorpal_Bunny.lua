-----------------------------------
-- Area: Ordelle's Caves
--  Mob: Vorpal Bunny
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 658, 2, invaderXim.regime.type.GROUNDS)
end

return entity
