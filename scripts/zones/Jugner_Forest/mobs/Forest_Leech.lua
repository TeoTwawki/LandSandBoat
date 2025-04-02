-----------------------------------
-- Area: Jugner Forest
--  Mob: Forest Leech
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 11, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 12, 2, invaderXim.regime.type.FIELDS)
end

return entity
