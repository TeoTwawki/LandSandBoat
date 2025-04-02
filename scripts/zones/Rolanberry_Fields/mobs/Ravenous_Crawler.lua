-----------------------------------
-- Area: Rolanberry Fields
--   NM: Ravenous Crawler
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.GRAVITY)
    mob:addImmunity(invaderXim.immunity.BIND)
    mob:setMod(invaderXim.mod.STORETP, 50)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 217)
end

entity.onMobDespawn = function(mob)
    UpdateNMSpawnPoint(mob:getID())
end

return entity
