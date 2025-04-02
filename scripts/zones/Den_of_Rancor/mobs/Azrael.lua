-----------------------------------
-- Area: Den Of Rancor
--  Mob: Azrael
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 900)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 15000)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 18000)
end

entity.onMobSpawn = function(mob)
    mob:setMod(invaderXim.mod.TRIPLE_ATTACK, 15)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
