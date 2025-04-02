-----------------------------------
-- Area: Meriphataud Mountains [S]
--   NM: Bloodlapper
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 1800)
end

entity.onMobSpawn = function(mob)
    mob:addImmunity(invaderXim.immunity.SILENCE)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 526)
end

return entity
