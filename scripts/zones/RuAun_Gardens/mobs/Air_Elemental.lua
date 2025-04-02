-----------------------------------
-- Area: RuAun Gardens
--  Mob: Air Elemental
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 145, 2, invaderXim.regime.type.FIELDS)
end

return entity
