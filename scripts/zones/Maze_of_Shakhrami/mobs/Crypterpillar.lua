-----------------------------------
-- Area: Maze of Shakhrami
--  Mob: Crypterpillar
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 702, 2, invaderXim.regime.type.GROUNDS)
end

return entity
