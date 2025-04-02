-----------------------------------
-- Area: RoMaeve
--   NM: Nargun
-----------------------------------
---@type TMobEntity
local entity = {}

local spawnPoints =
{
    { x = -107.888, y = 4.000, z = 112.399 },
    { x = -111.739, y = 4.000, z = 114.772 },
    { x = -119.399, y = 4.000, z = 109.537 },
    { x = -127.626, y = 4.000, z = 106.828 },
    { x = -143.349, y = 4.000, z = 108.313 },
    { x = -147.202, y = 4.000, z = 99.363 },
    { x = -144.044, y = 4.000, z = 90.136 },
}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
    mob:addImmunity(invaderXim.immunity.BIND)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.GRAVITY)
    mob:addImmunity(invaderXim.immunity.PLAGUE)
    mob:addImmunity(invaderXim.immunity.TERROR)

    invaderXim.mob.updateNMSpawnPoint(mob, spawnPoints)
    mob:setRespawnTime(7200)
end

entity.onMobSpawn = function(mob)
    mob:setMod(invaderXim.mod.STORETP, 135)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.STUN)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 330)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.updateNMSpawnPoint(mob, spawnPoints)
    mob:setRespawnTime(7200)
end

return entity
