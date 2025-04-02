-----------------------------------
-- Area: Den of Rancor
--  Mob: Cave Worm
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 796, 2, invaderXim.regime.type.GROUNDS)
end

return entity
