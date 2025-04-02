-----------------------------------
-- Area: Maze of Shakhrami
--  Mob: Bleeder Leech
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 701, 2, invaderXim.regime.type.GROUNDS)
end

return entity
