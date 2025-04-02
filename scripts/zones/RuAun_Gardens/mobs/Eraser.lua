-----------------------------------
-- Area: RuAun Gardens
--  Mob: Eraser (Monster)
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 143, 2, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 144, 1, invaderXim.regime.type.FIELDS)
end

return entity
