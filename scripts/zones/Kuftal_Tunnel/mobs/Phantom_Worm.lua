-----------------------------------
-- Area: Kuftal Tunnel
--   NM: Phantom Worm
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobSpawn = function(mob)
    mob:addImmunity(invaderXim.immunity.SILENCE)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addMod(invaderXim.mod.REGEN, 35)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
