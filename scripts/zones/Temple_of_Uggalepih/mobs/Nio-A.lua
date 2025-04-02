-----------------------------------
-- Area: Temple of Uggalepih
--   NM: Nio-A
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobSpawn = function(mob)
    DespawnMob(mob:getID(), 180)
    mob:addMod(invaderXim.mod.SLEEP_MEVA, 50)
    mob:addMod(invaderXim.mod.LULLABY_MEVA, 50)
    mob:addMod(invaderXim.mod.STUN_MEVA, 50)
    mob:addMod(invaderXim.mod.DMGMAGIC, 8000)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
