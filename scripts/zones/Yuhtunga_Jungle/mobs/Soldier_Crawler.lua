-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Soldier Crawler
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 128, 2, invaderXim.regime.type.FIELDS)
end

return entity
