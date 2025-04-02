-----------------------------------
-- Spell: Reactor Cool
-- Enhances defense and covers you with magical ice spikes. Enemies that hit you take ice damage
-- Spell cost: 28 MP
-- Monster Type: Luminions
-- Spell Type: Magical (Ice)
-- Blue Magic Points: 5
-- Stat Bonus: INT+3 MND+3
-- Level: 74
-- Casting Time: 3 seconds
-- Recast Time: 60 seconds
-- Duration: 120 seconds (2 minutes)
-----------------------------------
-- Combos: Magic Attack Bonus
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local duration = invaderXim.spells.blue.calculateDurationWithDiffusion(caster, 120)

    -- Reactor Cool Will Overwrite Ice Spikes and Def Boost regardless of Power
    if
        target:hasStatusEffect(invaderXim.effect.DEFENSE_BOOST) or
        target:hasStatusEffect(invaderXim.effect.ICE_SPIKES)
    then
        target:delStatusEffectSilent(invaderXim.effect.DEFENSE_BOOST)
        target:delStatusEffectSilent(invaderXim.effect.ICE_SPIKES)
    end

    target:addStatusEffect(invaderXim.effect.DEFENSE_BOOST, 12, 0, duration)
    target:addStatusEffect(invaderXim.effect.ICE_SPIKES, 5, 0, duration)
    spell:setMsg(invaderXim.msg.basic.MAGIC_GAIN_EFFECT)

    return invaderXim.effect.DEFENSE_BOOST
end

return spellObject
