-----------------------------------
-- Area: RuAun Gardens
--  Mob: Water Elemental
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 146, 3, invaderXim.regime.type.FIELDS)
end

return entity
