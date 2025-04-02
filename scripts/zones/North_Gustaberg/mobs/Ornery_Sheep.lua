-----------------------------------
-- Area: North Gustaberg
--  Mob: Ornery Sheep
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 59, 2, invaderXim.regime.type.FIELDS)
end

return entity
