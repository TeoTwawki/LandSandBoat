-----------------------------------
-- Area: Jugner Forest
--  Mob: Jugner Funguar
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 13, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 14, 1, invaderXim.regime.type.FIELDS)
end

return entity
