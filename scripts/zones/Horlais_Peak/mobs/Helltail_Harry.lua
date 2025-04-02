-----------------------------------
-- Area: Horlais Peak
--  Mob: Helltail Harry
-- BCNM: Tails of Woe
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setMod(invaderXim.mod.SLEEP_MEVA, 1000)
    mob:setMod(invaderXim.mod.SILENCE_MEVA, 900)
    mob:setMod(invaderXim.mod.LULLABY_MEVA, 700)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
