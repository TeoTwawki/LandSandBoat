-----------------------------------
-- Area: Pashhow Marshlands
--  Mob: Gadfly
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 21, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 22, 2, invaderXim.regime.type.FIELDS)
end

return entity
