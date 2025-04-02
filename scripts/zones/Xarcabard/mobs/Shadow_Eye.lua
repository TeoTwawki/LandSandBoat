-----------------------------------
-- Area: Xarcabard
--  Mob: Shadow Eye
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 315)
end

return entity
