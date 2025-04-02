-----------------------------------
-- Area: Bibiki Bay
--   NM: Serra
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 4 })
    invaderXim.hunts.checkHunt(mob, player, 264)
end

return entity
