-----------------------------------
-- Area: Western Altepa Desert
--   NM: Dahu
--  WOTG Nov 2009 NM: Immune to Bind, Sleep, Gravity. Uses only 1 TP move.
-----------------------------------
---@type TMobEntity
local entity = {}

local validWeather =
{
    invaderXim.weather.DUST_STORM,
    invaderXim.weather.SAND_STORM,
    invaderXim.weather.HOT_SPELL,
    invaderXim.weather.HEAT_WAVE,
}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onMobSpawn = function(mob)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.GRAVITY)
    mob:addImmunity(invaderXim.immunity.BIND)
    mob:setMod(invaderXim.mod.STORETP, 30)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.ENSTONE)
end

entity.onMobRoam = function(mob)
    local weather = mob:getWeather()

    if not utils.contains(weather, validWeather) then
        DespawnMob(mob:getID())
    end
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 413)
end

entity.onMobDespawn = function(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(3600)
end

return entity
