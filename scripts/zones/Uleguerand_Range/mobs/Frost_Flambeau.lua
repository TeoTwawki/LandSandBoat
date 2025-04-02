-----------------------------------
-- Area: Uleguerand Range
--   NM: Frost Flambeau
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.MAGIC_COOL, 15)
    mob:setMod(invaderXim.mod.UFASTCAST, 50)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 320)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(math.random(7200, 9000)) -- 2 to 2.5 hours
end

return entity
