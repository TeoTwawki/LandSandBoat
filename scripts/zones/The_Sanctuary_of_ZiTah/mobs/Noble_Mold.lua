-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--  Mob: Noble Mold
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 115, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 116, 2, invaderXim.regime.type.FIELDS)
end

return entity
