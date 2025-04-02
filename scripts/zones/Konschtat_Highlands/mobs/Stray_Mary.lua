-----------------------------------
-- Area: Konschtat Highlands
--   NM: Stray Mary
-----------------------------------
require('scripts/quests/tutorial')
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 203)
    player:addTitle(invaderXim.title.MARYS_GUIDE)
    invaderXim.tutorial.onMobDeath(player)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 710 })
end

return entity
