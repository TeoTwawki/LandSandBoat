-----------------------------------
-- Area: Maze of Shakhrami
--  Mob: Labyrinth Scorpion
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 700, 2, invaderXim.regime.type.GROUNDS)
end

return entity
