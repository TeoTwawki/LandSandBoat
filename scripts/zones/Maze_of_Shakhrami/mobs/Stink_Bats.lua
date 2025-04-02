-----------------------------------
-- Area: Maze of Shakhrami
--  Mob: Stink Bats
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 695, 2, invaderXim.regime.type.GROUNDS)
end

return entity
