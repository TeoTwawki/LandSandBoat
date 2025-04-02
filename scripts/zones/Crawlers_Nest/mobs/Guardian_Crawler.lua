-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Guardian Crawler
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 120)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
