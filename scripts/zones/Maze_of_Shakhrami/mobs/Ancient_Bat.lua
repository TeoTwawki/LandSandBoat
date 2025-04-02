-----------------------------------
-- Area: Maze of Shakhrami
--  Mob: Ancient Bat
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 698, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 699, 2, invaderXim.regime.type.GROUNDS)
end

return entity
