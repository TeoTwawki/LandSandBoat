-----------------------------------
-- Area: Quicksand Caves
--  Mob: Ancient Vessel
-- Mithra and the Crystal (Zilart 12) Fight
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 600)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
