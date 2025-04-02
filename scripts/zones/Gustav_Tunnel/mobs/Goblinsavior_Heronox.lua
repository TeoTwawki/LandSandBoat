-----------------------------------
-- Area: Gustav Tunnel
--   NM: Goblinsavior Heronox
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

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 423)
end

return entity
