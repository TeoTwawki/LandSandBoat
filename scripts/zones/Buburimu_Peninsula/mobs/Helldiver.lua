-----------------------------------
-- Area: Buburimu Peninsula (118)
--  Mob: Helldiver
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 262)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 69 })
end

return entity
