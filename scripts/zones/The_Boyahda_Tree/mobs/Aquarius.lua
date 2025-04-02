-----------------------------------
-- Area: The Boyahda Tree
--   NM: Aquarius
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 18000)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 18000)
end

entity.onMobSpawn = function(mob)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.POISON)
    mob:setMod(invaderXim.mod.UDMGPHYS, -5000)
    mob:setMod(invaderXim.mod.UDMGRANGE, -5000)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.ENWATER)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 358)
end

return entity
