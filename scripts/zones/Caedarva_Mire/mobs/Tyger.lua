-----------------------------------
-- Area: Caedarva Mire
--  ZNM: Tyger
-- !pos -766 -12 632 79
-- Spawn with Singed Buffalo: !additem 2593
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 300)
end

entity.onMobSpawn = function(mob)
    mob:addMod(invaderXim.mod.SLEEP_MEVA, 30)
    mob:addMod(invaderXim.mod.BIND_MEVA, 30)
    mob:addMod(invaderXim.mod.GRAVITY_MEVA, 30)
    mob:addMod(invaderXim.mod.ATT, 200)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
