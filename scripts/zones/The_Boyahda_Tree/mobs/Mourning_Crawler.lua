-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Mourning Crawler
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 726, 3, invaderXim.regime.type.GROUNDS)
end

return entity
