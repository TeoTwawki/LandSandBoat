-----------------------------------
-- Area: East Sarutabaruta
--  Mob: Carrion Crow
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 93, 1, invaderXim.regime.type.FIELDS)
end

return entity
