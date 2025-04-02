-----------------------------------
-- Area: Cape Teriggan
--  Mob: Sand Cockatrice
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 107, 2, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 108, 1, invaderXim.regime.type.FIELDS)
end

return entity
