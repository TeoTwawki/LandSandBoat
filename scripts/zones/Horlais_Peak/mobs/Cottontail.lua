-----------------------------------
-- Area: Horlais Peak
--  Mob: Cottontail
-- BCNM: Tails of Woe
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setMobMod(invaderXim.mobMod.CHARMABLE, 1)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
