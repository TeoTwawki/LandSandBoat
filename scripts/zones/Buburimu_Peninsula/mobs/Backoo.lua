-----------------------------------
-- Area: Buburimu Peninsula (118)
--   NM: Backoo
-- Note: Spawns only from hours 06 to 16.
-----------------------------------
local ID = zones[invaderXim.zone.BUBURIMU_PENINSULA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.SLOW)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 263)
end

entity.onMobDespawn = function(mob)
    GetMobByID(ID.mob.BACKOO):setRespawnTime(math.random(3600, 5400)) -- 60-90 minute respawn, depending on if it's daytime
end

return entity
