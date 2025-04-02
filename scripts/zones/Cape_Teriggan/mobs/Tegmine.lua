-----------------------------------
-- Area: Cape Teriggan
--   NM: Tegmine
-----------------------------------
---@type TMobEntity
local entity = {}

local spawnPoints =
{
    { x = -11.082, y = -1.124, z = -109.332 },
    { x =  -1.728, y =  0.295, z = -110.063 },
    { x =   4.875, y =  0.042, z = -119.958 },
    { x =   2.422, y = -0.614, z = -129.876 },
    { x =  -5.618, y = -0.341, z = -124.383 },
    { x = -11.142, y = -2.023, z = -123.280 },
}

entity.onMobInitialize = function(mob)
    invaderXim.mob.updateNMSpawnPoint(mob, spawnPoints)
    mob:setRespawnTime(math.random(7200, 7800)) -- 120 to 130 min
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onMobSpawn = function(mob)
    mob:addMod(invaderXim.mod.ATT, 50)
    mob:setMod(invaderXim.mod.DOUBLE_ATTACK, 40)
    mob:addImmunity(invaderXim.immunity.BIND)
    mob:addImmunity(invaderXim.immunity.BLIND)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.GRAVITY)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.PARALYZE)
    mob:addImmunity(invaderXim.immunity.POISON)
    mob:addImmunity(invaderXim.immunity.STUN)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.ENWATER)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 404)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.updateNMSpawnPoint(mob, spawnPoints)
    mob:setRespawnTime(math.random(7200, 7800)) -- 120 to 130 min
end

return entity
