-----------------------------------
-- Area: Alzadaal Undersea Ruins
--   NM: Boompadu
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 476)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(math.random(7200, 9000)) -- 120 to 150 minutes
end

return entity
