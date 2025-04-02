-----------------------------------
-- Area: Bibiki Bay
--   NM: Intulo
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 265)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 71, 285, 433 })
end

return entity
