-----------------------------------
-- Area: Inner Horutoto Ruins
--   NM: Nocuous Weapon
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.POISON)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 2 })
    invaderXim.hunts.checkHunt(mob, player, 287)
end

return entity
