-----------------------------------
-- Area: Misareaux Coast
--   NM: Okyupete
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 446)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 221, 649, 715, 946 })
end

return entity
