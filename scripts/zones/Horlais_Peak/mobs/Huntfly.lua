-----------------------------------
-- Area: Horlais Peak
--  Mob: Huntfly
-- BCNM: Dropping Like Flies
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setMobMod(invaderXim.mobMod.NO_STANDBACK, 1)
    mob:setMod(invaderXim.mod.SLEEP_MEVA, 1000)
    mob:setMod(invaderXim.mod.LULLABY_MEVA, 1000)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
