-----------------------------------
-- Area: RuAun Gardens
--  Mob: Fire Elemental
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 145, 1, invaderXim.regime.type.FIELDS)
end

return entity
