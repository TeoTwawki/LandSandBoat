-----------------------------------
-- Area: Qufim Island
--   NM: Trickster Kinetix
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 307)
end

return entity
