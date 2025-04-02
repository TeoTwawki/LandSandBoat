-----------------------------------
-- Area: Maze of Shakhrami
--  Mob: Ghoul
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 697, 1, invaderXim.regime.type.GROUNDS)
end

return entity
