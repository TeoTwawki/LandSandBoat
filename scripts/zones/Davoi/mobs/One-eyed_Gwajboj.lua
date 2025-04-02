-----------------------------------
-- Area: Davoi
--  Mob: One-eyed Gwajboj
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobSpawn = function(mob)
    mob:addMod(invaderXim.mod.SLEEP_MEVA, 90)
    mob:addMod(invaderXim.mod.LULLABY_MEVA, 90)
    mob:addMod(invaderXim.mod.SILENCE_MEVA, 90)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
