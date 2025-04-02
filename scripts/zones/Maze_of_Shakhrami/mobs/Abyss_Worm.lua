-----------------------------------
-- Area: Maze of Shakhrami
--  Mob: Abyss Worm
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 699, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 700, 1, invaderXim.regime.type.GROUNDS)
end

return entity
