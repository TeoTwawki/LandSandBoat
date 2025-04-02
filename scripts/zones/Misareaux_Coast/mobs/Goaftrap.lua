-----------------------------------
-- Area: Misareaux Coast
--   NM: Goaftrap
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(invaderXim.mod.DOUBLE_ATTACK, 20)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 444)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(math.random(5400, 7200)) -- 90 to 120 min
end

return entity
