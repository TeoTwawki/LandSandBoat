-----------------------------------
-- Area: Maze of Shakhrami
--  Mob: Chaser Bats
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 701, 1, invaderXim.regime.type.GROUNDS)
end

return entity
