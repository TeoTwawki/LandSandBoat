-----------------------------------
-- Area: Bhaflau Thickets
--   NM: Mahishasura
-- !pos 206.510 -16.320 357.724 52
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.PLAGUE)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 454)
end

return entity
