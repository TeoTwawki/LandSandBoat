-----------------------------------
-- Area: Horlais Peak
--  Mob: Houndfly
-- BCNM: Dropping Like Flies
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setMod(invaderXim.mod.LULLABY_MEVA, 500)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
