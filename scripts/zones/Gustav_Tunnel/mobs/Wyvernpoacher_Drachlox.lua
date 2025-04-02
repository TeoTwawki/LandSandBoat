-----------------------------------
-- Area: Gustav Tunnel
--   NM: Wyvernpoacher Drachlox
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 6000)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 6000)
end

entity.onMobSpawn = function(mob)
    mob:addImmunity(invaderXim.immunity.TERROR)
end

return entity
