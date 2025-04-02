-----------------------------------
-- Area: Quicksand Caves
--   NM: Hastatus XI-XII
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 650)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 1450)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
