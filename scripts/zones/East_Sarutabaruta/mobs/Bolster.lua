-----------------------------------
-- Area: East Sarutabaruta
--  Mob: Bolster
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 92, 2, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 93, 2, invaderXim.regime.type.FIELDS)
end

return entity
