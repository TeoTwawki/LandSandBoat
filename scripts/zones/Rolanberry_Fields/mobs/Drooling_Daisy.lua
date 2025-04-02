-----------------------------------
-- Area: Rolanberry Fields
--   NM: Drooling Daisy
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 216)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 152 })
end

entity.onMobDespawn = function(mob)
    UpdateNMSpawnPoint(mob:getID())
end

return entity
