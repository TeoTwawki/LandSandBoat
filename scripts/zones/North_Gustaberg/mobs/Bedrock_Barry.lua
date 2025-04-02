-----------------------------------
-- Area: North Gustaberg
--   NM: Bedrock Barry
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:addStatusEffect(invaderXim.effect.STONESKIN, math.random(30, 40), 0, 300)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 199)
    invaderXim.regime.checkRegime(player, mob, 16, 1, invaderXim.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(3600, 4200))
end

return entity
