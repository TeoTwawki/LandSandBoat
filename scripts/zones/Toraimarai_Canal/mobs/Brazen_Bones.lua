-----------------------------------
-- Area: Toraimarai Canal
--   NM: Brazen Bones
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setMobMod(invaderXim.mobMod.AUTO_SPIKES, 1)
    mob:addStatusEffect(invaderXim.effect.ICE_SPIKES, 50, 0, 0)
    mob:getStatusEffect(invaderXim.effect.ICE_SPIKES):setEffectFlags(invaderXim.effectFlag.DEATH)
    mob:setMobMod(invaderXim.mobMod.ADD_EFFECT, 1)
    mob:setMod(invaderXim.mod.ICE_MEVA, 100)
end

entity.onSpikesDamage = function(mob, target, damage)
    -- "damage" is the power of the status effect up in onMobinitialize.
    local intDiff = mob:getStat(invaderXim.mod.INT) - target:getStat(invaderXim.mod.INT)
    local dmg = damage + intDiff
    local params = {}
    params.bonusmab = 0
    params.includemab = false
    dmg = addBonusesAbility(mob, invaderXim.element.ICE, target, dmg, params)
    dmg = dmg * applyResistanceAddEffect(mob, target, invaderXim.element.ICE, 0)
    dmg = dmg * invaderXim.spells.damage.calculateNukeAbsorbOrNullify(target, invaderXim.element.ICE)
    dmg = finalMagicNonSpellAdjustments(mob, target, invaderXim.element.ICE, dmg)

    if dmg < 0 then
        dmg = 0
    end

    return invaderXim.subEffect.ICE_SPIKES, invaderXim.msg.basic.SPIKES_EFFECT_DMG, dmg
end

entity.onAdditionalEffect = function(mob, target, damage)
    return invaderXim.mob.onAddEffect(mob, target, damage, invaderXim.mob.ae.ENBLIZZARD)
end

entity.onMobFight = function(mob, target)
    -- Double Attack rate increases as HP decreases
    local doubleAttack = (100 - mob:getHPP()) * 0.5
    if mob:getMod(invaderXim.mod.DOUBLE_ATTACK) ~= utils.clamp(doubleAttack, 1, 100) then
        mob:setMod(invaderXim.mod.DOUBLE_ATTACK, utils.clamp(doubleAttack, 1, 100))
    end
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 286)
end

return entity
