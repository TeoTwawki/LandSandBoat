-----------------------------------
-- Area: Yhoator Jungle (124)
--   NM: Powderer Penny
--   WOTG Nov 2009 NM: Immune to Bind, Sleep, Gravity. Uses only 1 TP move.
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.GRAVITY)
    mob:addImmunity(invaderXim.immunity.BIND)
    mob:setMod(invaderXim.mod.STORETP, 10)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 365)
end

entity.onMobDespawn = function(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(5400, 7200)) -- 90 to 120 minutes
end

return entity
