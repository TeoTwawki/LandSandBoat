-----------------------------------
-- Area: Lower Delkfutt's Tower
--  Mob: Gigas Sculptor
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 778, 2, invaderXim.regime.type.GROUNDS)
end

return entity
