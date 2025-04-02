-----------------------------------
-- Area: King Ranperres Tomb
--   NM: Ankou
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 176)
end

return entity
