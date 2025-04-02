-----------------------------------
-- Area: Ordelle's Caves
--  Mob: Seeker Bats
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 658, 1, invaderXim.regime.type.GROUNDS)
end

return entity
