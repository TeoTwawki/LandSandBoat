-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Soldier Crawler
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 688, 1, invaderXim.regime.type.GROUNDS)
end

return entity
