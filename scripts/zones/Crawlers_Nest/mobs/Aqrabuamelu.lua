-----------------------------------
-- Area: Crawlers' Nest
--   NM: Aqrabuamelu
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.AUTO_SPIKES, 1)
    mob:addStatusEffect(invaderXim.effect.ICE_SPIKES, 50, 0, 0)
    mob:getStatusEffect(invaderXim.effect.ICE_SPIKES):setEffectFlags(invaderXim.effectFlag.DEATH)
end

entity.onSpikesDamage = function(mob, target, damage)
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

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 238)
end

entity.onMobDespawn = function(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(7200, 7800)) -- 120 to 130 min
end

return entity
