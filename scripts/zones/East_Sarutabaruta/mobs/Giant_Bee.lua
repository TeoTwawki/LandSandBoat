-----------------------------------
-- Area: East Sarutabaruta
--  Mob: Giant Bee
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 90, 1, invaderXim.regime.type.FIELDS)
end

return entity
