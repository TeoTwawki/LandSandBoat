-----------------------------------
-- Spell: Memento Mori
-- Enhances magic attack
-- Spell cost: 46 MP
-- Monster Type: Undead
-- Spell Type: Magical (Ice)
-- Blue Magic Points: 4
-- Stat Bonus: INT+1
-- Level: 62
-- Casting Time: 6 seconds
-- Recast Time: 2 minutes
-----------------------------------
-- Combos: Magic Attack Bonus
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local power = 20
    local duration = invaderXim.spells.blue.calculateDurationWithDiffusion(caster, 60)

    if not target:addStatusEffect(invaderXim.effect.MAGIC_ATK_BOOST, power, 0, duration) then
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)
    end

    return invaderXim.effect.MAGIC_ATK_BOOST
end

return spellObject
