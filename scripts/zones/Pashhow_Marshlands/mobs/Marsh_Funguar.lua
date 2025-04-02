-----------------------------------
-- Area: Pashhow Marshlands
--  Mob: Marsh Funguar
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 24, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 60, 2, invaderXim.regime.type.FIELDS)
end

return entity
