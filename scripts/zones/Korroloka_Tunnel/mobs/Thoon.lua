-----------------------------------
-- Area: Korroloka Tunnel
--   NM: Thoon
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 229)
end

return entity
