-----------------------------------
-- Area: Ordelle's Caves
--  Mob: Goliath Beetle
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 660, 1, invaderXim.regime.type.GROUNDS)
end

return entity
