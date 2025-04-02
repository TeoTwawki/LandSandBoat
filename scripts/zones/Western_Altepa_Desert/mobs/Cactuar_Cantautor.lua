-----------------------------------
-- Area: Western Altepa Desert
--   NM: Cactuar Cantautor
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 412)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 781 })
end

entity.onMobDespawn = function(mob)
    UpdateNMSpawnPoint(mob:getID())
end

return entity
