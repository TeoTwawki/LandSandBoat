-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Death Jacket
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 687, 2, invaderXim.regime.type.GROUNDS)
end

return entity
