-----------------------------------
-- Area: Buburimu Peninsula (118)
--  Mob: Buburimboo
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 261)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 645 })
end

return entity
