-----------------------------------
-- Area: Giddeus (145)
--   NM: Zhuu Buxu the Silent
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 20)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 25)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
