-----------------------------------
-- Area: Quicksand Caves
--   NM: Centurio X-I
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ALWAYS_AGGRO, 1)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 2000)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 6000)
    mob:setMobMod(invaderXim.mobMod.MUG_GIL, 630)
end

entity.onMobSpawn = function(mob)
    mob:addMod(invaderXim.mod.SILENCE_MEVA, 35)
    mob:addMod(invaderXim.mod.SLEEP_MEVA, 50)
    mob:addMod(invaderXim.mod.LULLABY_MEVA, 50)
    mob:addMod(invaderXim.mod.SPELLINTERRUPT, 25)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 426)
end

return entity
