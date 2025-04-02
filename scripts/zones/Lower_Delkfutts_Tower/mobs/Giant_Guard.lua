-----------------------------------
-- Area: Lower Delkfutt's Tower
--  Mob: Giant Guard
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 778, 2, invaderXim.regime.type.GROUNDS)
end

return entity
