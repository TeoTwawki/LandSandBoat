-----------------------------------
-- Area: Kuftal Tunnel
--   NM: Sabotender Mariachi
-----------------------------------
---@type TMobEntity
local entity = {}

-- 1% per tick regen during the day
local mobRegen = function(mob)
    local hour = VanadielHour()
    if hour >= 6 and hour < 18 then
        mob:setMod(invaderXim.mod.REGEN, 80)
    else
        mob:setMod(invaderXim.mod.REGEN, 0)
    end
end

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 15000)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 15000)
end

entity.onMobSpawn = function(mob)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
end

entity.onMobRoam = function(mob)
    mobRegen(mob)
end

entity.onMobFight = function(mob, target)
    mobRegen(mob)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 417)
end

return entity
