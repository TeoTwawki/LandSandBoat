-----------------------------------
-- Area: Maze of Shakhrami
--  Mob: Goblin Gambler
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 695, 1, invaderXim.regime.type.GROUNDS)
end

return entity
