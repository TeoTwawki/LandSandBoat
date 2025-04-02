-----------------------------------
-- Area: RuAun Gardens
--  Mob: Earth Elemental
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 146, 2, invaderXim.regime.type.FIELDS)
end

return entity
