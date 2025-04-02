-----------------------------------
-- Area: RuAun Gardens
--  Mob: Thunder Elemental
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 145, 3, invaderXim.regime.type.FIELDS)
end

return entity
