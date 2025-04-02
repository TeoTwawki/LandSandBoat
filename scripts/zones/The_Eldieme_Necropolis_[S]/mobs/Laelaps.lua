-----------------------------------
-- Area: The Eldieme Necropolis [S]
--   NM: Laelaps
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 495)
end

return entity
