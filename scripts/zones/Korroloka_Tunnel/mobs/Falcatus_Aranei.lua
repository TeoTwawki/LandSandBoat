-----------------------------------
-- Area: Korroloka Tunnel
--   NM: Falcatus Aranei
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 1200)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 1903)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 227)
end

return entity
