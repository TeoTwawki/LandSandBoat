-----------------------------------
-- Area: Quicksand Caves
--   NM: Antican Praefectus
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 2100)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 4500)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 431)
end

return entity
