-----------------------------------
-- Area: Temple of Uggalepih
--   NM: Habetrot
-- !pos -60 -8 58 220
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 900)
    mob:setMobMod(invaderXim.mobMod.GIL_MIN, 2000)
    mob:setMobMod(invaderXim.mobMod.GIL_MAX, 5625)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.SLOW)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 386)
end

return entity
