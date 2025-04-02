-----------------------------------
-- Area: West Sarutabaruta
--  Mob: Bakru
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 26, 1, invaderXim.regime.type.FIELDS)
end

return entity
