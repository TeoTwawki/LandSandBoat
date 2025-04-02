-----------------------------------
-- Area: Rolanberry Fields
--  Mob: Copper Quadav
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 87, 2, invaderXim.regime.type.FIELDS)
end

return entity
