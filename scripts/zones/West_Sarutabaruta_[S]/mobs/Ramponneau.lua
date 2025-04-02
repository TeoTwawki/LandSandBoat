-----------------------------------
-- Area: West Sarutabaruta [S]
--   NM: Ramponneau
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
    mob:addStatusEffect(invaderXim.effect.SHOCK_SPIKES, 10, 0, 0)
    mob:getStatusEffect(invaderXim.effect.SHOCK_SPIKES):setEffectFlags(invaderXim.effectFlag.DEATH)
end

entity.onMobFight = function(mob, target)
    mob:setMobAbilityEnabled(false)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.ENBLIZZARD)
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 519)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 72, 286, 434 })
end

return entity
