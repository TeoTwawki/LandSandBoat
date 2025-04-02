-----------------------------------
-- Spell: Geist Wall
-- Removes one beneficial magic effect from enemies within range
-- Spell cost: 35 MP
-- Monster Type: Lizards
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 3
-- Stat Bonus: HP-5, MP+10
-- Level: 46
-- Casting Time: 3 seconds
-- Recast Time: 30 seconds
-- Magic Bursts on: Compression, Gravitation, Darkness
-- Combos: None
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = invaderXim.ecosystem.LIZARD
    params.attribute = invaderXim.mod.INT
    params.skillType = invaderXim.skill.BLUE_MAGIC
    params.effect = invaderXim.effect.NONE
    local resistThreshold = 0.25
    local effect = invaderXim.effect.NONE

    local resist = applyResistanceEffect(caster, target, spell, params)
    if resist >= resistThreshold then
        effect = target:dispelStatusEffect()
        spell:setMsg(invaderXim.msg.basic.MAGIC_ERASE)
        if effect == invaderXim.effect.NONE then
            spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(invaderXim.msg.basic.MAGIC_RESIST)
    end

    return effect
end

return spellObject
