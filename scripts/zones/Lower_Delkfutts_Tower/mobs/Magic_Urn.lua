-----------------------------------
-- Area: Lower Delkfutt's Tower
--  Mob: Magic Urn
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 781, 2, xi.regime.type.GROUNDS)
end

return entity
