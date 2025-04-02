-----------------------------------
-- Area: Maze of Shakhrami
--  Mob: Combat
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 696, 2, invaderXim.regime.type.GROUNDS)
end

return entity
