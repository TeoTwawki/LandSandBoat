-----------------------------------
-- Area: Jugner Forest
--   NM: Panzer Percival
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 157)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 282 })
end

return entity
