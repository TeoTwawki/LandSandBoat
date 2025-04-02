-----------------------------------
-- Area: Lower Delkfutt's Tower
--  Mob: Magic Pot
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 781, 2, invaderXim.regime.type.GROUNDS)
end

return entity
