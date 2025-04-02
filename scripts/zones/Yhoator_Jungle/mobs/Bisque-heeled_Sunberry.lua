-----------------------------------
-- Area: Yhoator Jungle
--   NM: Bisque-heeled Sunberry
-----------------------------------
mixins = { require('scripts/mixins/families/tonberry') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 350)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 900)
end

entity.onMobSpawn = function(mob)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 133, 1, invaderXim.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(3600, 7200)) -- 1 to 2 hours
end

return entity
