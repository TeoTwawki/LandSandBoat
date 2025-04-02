-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Rumble Crawler
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 691, 1, invaderXim.regime.type.GROUNDS)
end

return entity
