-----------------------------------
-- Area: West Sarutabaruta
--  Mob: Giant Bee
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 61, 2, invaderXim.regime.type.FIELDS)
end

return entity
