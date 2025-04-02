-----------------------------------
-- Area: Meriphataud Mountains
--  Mob: Hill Lizard
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 37, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 38, 2, invaderXim.regime.type.FIELDS)
end

return entity
