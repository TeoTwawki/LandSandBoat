-----------------------------------
-- Area: RoMaeve
--   NM: Martinet
-----------------------------------
---@type TMobEntity
local entity = {}

local spawnPoints =
{
    { x = -187.611, y = -8.000, z = -35.805 },
    { x = -196.069, y = -8.000, z = -36.258 },
    { x = -199.632, y = -8.000, z = -46.155 },
    { x = -189.160, y = -8.000, z = -49.926 },
    { x = -191.781, y = -8.808, z = -38.077 },
    { x = -189.696, y = -8.500, z = -33.497 },
}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.AUTO_SPIKES, 1)
    mob:addImmunity(invaderXim.immunity.BIND)
    mob:addImmunity(invaderXim.immunity.DARK_SLEEP)
    mob:addImmunity(invaderXim.immunity.LIGHT_SLEEP)
    mob:addImmunity(invaderXim.immunity.GRAVITY)
    mob:addImmunity(invaderXim.immunity.PLAGUE)
    mob:addImmunity(invaderXim.immunity.TERROR)
    mob:addStatusEffect(invaderXim.effect.SHOCK_SPIKES, 60, 0, 0)
    mob:getStatusEffect(invaderXim.effect.SHOCK_SPIKES):setEffectFlags(invaderXim.effectFlag.DEATH)

    invaderXim.mob.updateNMSpawnPoint(mob, spawnPoints)
    mob:setRespawnTime(7200)
end

entity.onMobSpawn = function(mob)
    mob:setMod(invaderXim.mod.STORETP, 80)
end

entity.onSpikesDamage = function(mob, target, damage)
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
    invaderXim.hunts.checkHunt(mob, player, 329)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.updateNMSpawnPoint(mob, spawnPoints)
    mob:setRespawnTime(7200)
end

return entity
