-----------------------------------
-- Area: King Ranperres Tomb
--   NM: Corrupted Yorgos
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
    mob:setMod(invaderXim.mod.SLEEP_MEVA, 50)
    mob:setMod(invaderXim.mod.LULLABY_MEVA, 50)
end

entity.onMobSpawn = function(mob)
    DespawnMob(mob:getID(), 180)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
