-----------------------------------
-- Area: Quicksand Caves
--   NM: Antican Tribunus
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 6000)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 9234)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 432)
end

return entity
