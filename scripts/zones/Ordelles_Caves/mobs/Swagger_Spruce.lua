-----------------------------------
-- Area: Ordelle's Caves
--  Mob: Swagger Spruce
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 662, 2, invaderXim.regime.type.GROUNDS)
end

return entity
