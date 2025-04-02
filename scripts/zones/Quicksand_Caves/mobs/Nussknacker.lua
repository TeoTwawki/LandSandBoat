-----------------------------------
-- Area: Quicksand Caves
--   NM: Nussknacker
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 4800)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 6000)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 435)
end

return entity
