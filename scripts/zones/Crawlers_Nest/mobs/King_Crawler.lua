-----------------------------------
-- Area: Crawlers' Nest
--  Mob: King Crawler
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 693, 1, invaderXim.regime.type.GROUNDS)
end

return entity
