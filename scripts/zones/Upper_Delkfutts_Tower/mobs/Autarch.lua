-----------------------------------
-- Area: Upper Delkfutt's Tower
--   NM: Autarch
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.AUTO_SPIKES, 1)
    mob:addStatusEffect(invaderXim.effect.SHOCK_SPIKES, 40, 0, 0)
    mob:getStatusEffect(invaderXim.effect.SHOCK_SPIKES):setEffectFlags(invaderXim.effectFlag.DEATH)
end

entity.onMobSpawn = function(mob)
    mob:addMod(invaderXim.mod.ATT, 50)
    mob:setMod(invaderXim.mod.DOUBLE_ATTACK, 25)
    mob:setMod(invaderXim.mod.TRIPLE_ATTACK, 25)
end

entity.onSpikesDamage = function(mob, target, damage)
    -- "damage" is the power of the status effect up in onMobinitialize.
    local intDiff = mob:getStat(invaderXim.mod.INT) - target:getStat(invaderXim.mod.INT)
    local dmg = damage + intDiff
    local params = {}
    params.bonusmab = 0
    params.includemab = false
    dmg = addBonusesAbility(mob, invaderXim.element.THUNDER, target, dmg, params)
    dmg = dmg * applyResistanceAddEffect(mob, target, invaderXim.element.THUNDER, 0)
    dmg = dmg * invaderXim.spells.damage.calculateNukeAbsorbOrNullify(target, invaderXim.element.THUNDER)
    dmg = finalMagicNonSpellAdjustments(mob, target, invaderXim.element.THUNDER, dmg)

    if dmg < 0 then
        dmg = 0
    end

    return invaderXim.subEffect.SHOCK_SPIKES, invaderXim.msg.basic.SPIKES_EFFECT_DMG, dmg
end

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 333)
end

entity.onMobDespawn = function(mob)
    -- UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(1800, 10800)) -- 30 minutes to 3 hrs
end

return entity
