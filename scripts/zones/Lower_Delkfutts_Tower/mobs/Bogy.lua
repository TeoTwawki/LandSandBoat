-----------------------------------
-- Area: Lower Delkfutt's Tower
--  Mob: Bogy
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 780, 2, invaderXim.regime.type.GROUNDS)
end

return entity
