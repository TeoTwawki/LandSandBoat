-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Worker Crawler
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 687, 1, invaderXim.regime.type.GROUNDS)
end

return entity
