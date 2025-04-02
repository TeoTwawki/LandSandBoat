-----------------------------------
-- Area: Lower Delkfutt's Tower
--  Mob: Chaos Idol
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 779, 2, invaderXim.regime.type.GROUNDS)
end

return entity
