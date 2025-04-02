-----------------------------------
-- Area: Xarcabard [S]
--   NM: Tikbalang
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 540)
end

return entity
