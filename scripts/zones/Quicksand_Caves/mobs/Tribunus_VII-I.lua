-----------------------------------
-- Area: Quicksand Caves
--   NM: Tribunus VII-I
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 900)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 6000)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 9234)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 434)
end

return entity
