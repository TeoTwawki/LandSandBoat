-----------------------------------
-- Area: Carpenters' Landing
--   NM: Orctrap
-- !pos 180.087 -5.484 -532.799 2
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 167)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 70 })
end

return entity
