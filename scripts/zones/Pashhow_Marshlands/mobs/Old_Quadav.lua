-----------------------------------
-- Area: Pashhow Marshlands
--  Mob: Old Quadav
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 60, 1, invaderXim.regime.type.FIELDS)
end

return entity
