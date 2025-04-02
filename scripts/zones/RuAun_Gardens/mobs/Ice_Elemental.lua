-----------------------------------
-- Area: RuAun Gardens
--  Mob: Ice Elemental
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 146, 1, invaderXim.regime.type.FIELDS)
end

return entity
