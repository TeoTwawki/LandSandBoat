-----------------------------------
-- Area: Gustav Tunnel
--   NM: Taxim
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 3600)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 3600)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 424)
end

return entity
