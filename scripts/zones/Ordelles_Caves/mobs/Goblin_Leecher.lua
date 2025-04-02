-----------------------------------
-- Area: Ordelle's Caves
--  Mob: Goblin Leecher
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 657, 1, invaderXim.regime.type.GROUNDS)
end

return entity
