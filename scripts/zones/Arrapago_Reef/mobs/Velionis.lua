-----------------------------------
-- Area: Arrapago Reef
--  ZNM: Velionis
-----------------------------------
mixins = { require('scripts/mixins/rage') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.AUTO_SPIKES, 1)
    mob:addStatusEffect(invaderXim.effect.BLAZE_SPIKES, 200, 0, 0) -- Wiki says "180-230" and we have NO DATA! We don't know what the players conditions/gear was.
    mob:getStatusEffect(invaderXim.effect.BLAZE_SPIKES):setEffectFlags(invaderXim.effectFlag.DEATH)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 300)
end

entity.onMobSpawn = function(mob)
    mob:setLocalVar('[rage]timer', 3600) -- 60 minutes
    mob:setAutoAttackEnabled(false)
    mob:setMod(invaderXim.mod.FASTCAST, 15)
    mob:setLocalVar('HPP', 90)
    mob:setMobMod(invaderXim.mobMod.MAGIC_COOL, 10)
end

entity.onMobFight = function(mob, target)
    local fastCast = mob:getLocalVar('HPP')
    if mob:getHPP() <= fastCast then
        if mob:getHPP() > 10 then
            mob:addMod(invaderXim.mod.FASTCAST, 15)
            mob:setLocalVar('HPP', mob:getHPP() - 10)
        end
    end
end

entity.onSpikesDamage = function(mob, target, damage)
    -- we don't have an "isCasting()" so use getCurrentAction() instead
    if mob:getCurrentAction() == invaderXim.action.MAGIC_CASTING then
        -- No spikes when mid-cast.
        return 0, 0, 0
    else
        -- Again per the note above, we have no data for what the actual damage should be.
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
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
