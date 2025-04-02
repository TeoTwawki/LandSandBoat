-----------------------------------
-- Area: Gustav Tunnel
--   NM: Ungur
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 12000)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 12000)
end

entity.onMobSpawn = function(mob)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.TERROR)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 475)
end

return entity
