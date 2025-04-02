-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--   NM: Elusive Edwin
--  WOTG Nov 2009 NM: Immune to Bind, Sleep, Gravity. Uses only 1 TP move.
-----------------------------------
---@type TMobEntity
local entity = {}

local spawnPoints =
{
    { x = 340.385, y =  0.188, z = -133.432 },
    { x = 363.777, y =  0.151, z = -167.571 },
    { x = 369.662, y = -0.882, z = -148.873 },
    { x = 321.290, y =  0.000, z = -121.171 },
}

entity.onMobInitialize = function(mob)
    invaderXim.mob.updateNMSpawnPoint(mob, spawnPoints)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onMobSpawn = function(mob)
    mob:addImmunity(invaderXim.immunity.BIND)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.GRAVITY)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:setMod(invaderXim.mod.STORETP, 80)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.SILENCE)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 323)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.updateNMSpawnPoint(mob, spawnPoints)
    mob:setRespawnTime(7200 + math.random(0, 600)) -- 2 hours, then 10 minute window
end

return entity
