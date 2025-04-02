-----------------------------------
-- Area: Ordelles Caves
--   NM: Bombast
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.AUTO_SPIKES, 1)
    mob:addStatusEffect(invaderXim.effect.BLAZE_SPIKES, 15, 0, 0)
    mob:getStatusEffect(invaderXim.effect.BLAZE_SPIKES):setEffectFlags(invaderXim.effectFlag.DEATH)
end

entity.onSpikesDamage = function(mob, target, damage)
    -- "Damage" is the power of the status effect up in onMobinitialize.
    local intDiff = mob:getStat(invaderXim.mod.INT) - target:getStat(invaderXim.mod.INT)
    local dmg = damage + intDiff
    local params = {}
    params.bonusmab = 0
    params.includemab = false
    dmg = addBonusesAbility(mob, invaderXim.element.FIRE, target, dmg, params)
    dmg = dmg * applyResistanceAddEffect(mob, target, invaderXim.element.FIRE, 0)
    dmg = dmg * invaderXim.spells.damage.calculateNukeAbsorbOrNullify(target, invaderXim.element.FIRE)
    dmg = finalMagicNonSpellAdjustments(mob, target, invaderXim.element.FIRE, dmg)

    if dmg < 0 then
        dmg = 0
    end

    return invaderXim.subEffect.BLAZE_SPIKES, invaderXim.msg.basic.SPIKES_EFFECT_DMG, dmg
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 182)
end

return entity
