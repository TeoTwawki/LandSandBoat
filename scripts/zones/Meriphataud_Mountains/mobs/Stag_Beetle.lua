-----------------------------------
-- Area: Meriphataud Mountains
--  Mob: Stag Beetle
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 38, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 39, 2, invaderXim.regime.type.FIELDS)
end

return entity
