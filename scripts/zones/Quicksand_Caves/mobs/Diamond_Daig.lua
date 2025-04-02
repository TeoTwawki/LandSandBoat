-----------------------------------
-- Area: Quicksand Caves
--   NM: Diamond Daig
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 1200)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 3000)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 428)
end

return entity
