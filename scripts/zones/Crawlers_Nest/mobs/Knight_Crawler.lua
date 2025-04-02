-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Knight Crawler
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 692, 2, invaderXim.regime.type.GROUNDS)
end

return entity
