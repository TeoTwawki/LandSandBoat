-----------------------------------
-- Area: Meriphataud Mountains
--  Mob: Crane Fly
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 36, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 37, 2, invaderXim.regime.type.FIELDS)
end

return entity
