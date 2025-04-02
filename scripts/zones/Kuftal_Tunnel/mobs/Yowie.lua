-----------------------------------
-- Area: Kuftal Tunnel
--   NM: Yowie
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 12000)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 12000)
end

entity.onMobSpawn = function(mob)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.ENSTONE, { chance = 20 }) -- "Enstone's frequency is mildly low"
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 419)
end

return entity
