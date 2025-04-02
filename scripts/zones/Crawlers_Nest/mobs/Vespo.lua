-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Vespo
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 693, 2, invaderXim.regime.type.GROUNDS)
end

return entity
