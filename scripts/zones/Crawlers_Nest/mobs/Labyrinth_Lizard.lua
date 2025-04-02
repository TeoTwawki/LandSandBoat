-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Labyrinth Lizard
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 689, 1, invaderXim.regime.type.GROUNDS)
end

return entity
