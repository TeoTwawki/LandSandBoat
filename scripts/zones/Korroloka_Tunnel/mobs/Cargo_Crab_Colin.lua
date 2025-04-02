-----------------------------------
-- Area: Korroloka Tunnel (173)
--   NM: Cargo Crab Colin
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 1200)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 1950)
end

entity.onMobSpawn = function(mob)
    -- Has very high physical defense, takes normal damage from magic.
    mob:setMod(invaderXim.mod.UDMGPHYS, -7000)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.POISON, { power = 10 })
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 226)
end

return entity
