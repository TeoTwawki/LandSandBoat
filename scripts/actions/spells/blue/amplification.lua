-----------------------------------
-- Spell: Amplification
-- Enhances magic attack and magic defense
-- Spell cost: 48 MP
-- Monster Type: Amorphs
-- Spell Type: Magical (Water)
-- Blue Magic Points: 3
-- Stat Bonus: HP-5, MP+5
-- Level: 70
-- Casting Time: 7 seconds
-- Recast Time: 120 seconds
-- Duration: 90 seconds
-----------------------------------
-- Combos: None
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local duration = invaderXim.spells.blue.calculateDurationWithDiffusion(caster, 90)
    local returnEffect = invaderXim.effect.MAGIC_ATK_BOOST

    local actionOne = target:addStatusEffect(invaderXim.effect.MAGIC_ATK_BOOST, 10, 0, duration)
    local actionTwo = target:addStatusEffect(invaderXim.effect.MAGIC_DEF_BOOST, 10, 0, duration)

    if not actionOne and not actionTwo then -- both statuses fail to apply
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)
    elseif not actionOne and actionTwo then -- the first status fails to apply
        returnEffect = invaderXim.effect.MAGIC_DEF_BOOST
    elseif actionOne and not actionTwo then -- the second status fails to apply
        returnEffect = invaderXim.effect.MAGIC_ATK_BOOST
    end

    return returnEffect
end

return spellObject
