-----------------------------------
-- Area: Quicksand Caves
--   NM: Sabotender Bailarin
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 10000)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 13640)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 433)
end

return entity
