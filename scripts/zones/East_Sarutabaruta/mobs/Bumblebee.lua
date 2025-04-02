-----------------------------------
-- Area: East Sarutabaruta
--  Mob: Bumblebee
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 90, 1, invaderXim.regime.type.FIELDS)
end

return entity
