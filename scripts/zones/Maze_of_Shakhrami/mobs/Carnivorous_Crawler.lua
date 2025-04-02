-----------------------------------
-- Area: Maze of Shakhrami
--  Mob: Carnivorous Crawler
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 697, 2, invaderXim.regime.type.GROUNDS)
end

return entity
