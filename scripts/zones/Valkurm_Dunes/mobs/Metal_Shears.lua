-----------------------------------
-- Area: Valkurm Dunes
--   NM: Metal Shears
-----------------------------------
---@type TMobEntity
local entity = {}

local spawnPoints =
{
    { x = 480.000, y = -15.000, z = 313.000 },
    { x = 490.000, y = -15.000, z = 359.000 },
    { x = 534.000, y = -15.000, z = 358.000 },
    { x = 564.000, y = -15.000, z = 339.000 },
    { x = 545.000, y = -16.000, z = 298.000 },
    { x = 545.000, y = -16.000, z = 298.000 },
    { x = 509.000, y = -16.000, z = 293.000 },
}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
    invaderXim.mob.updateNMSpawnPoint(mob, spawnPoints)
    mob:setRespawnTime(math.random(3600, 4200)) -- 60-70 min repop
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.POISON, { power = 15, duration = math.random(10, 25) })
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 207)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.updateNMSpawnPoint(mob, spawnPoints)
    mob:setRespawnTime(math.random(3600, 4200)) -- 60-70 min repop
end

return entity
