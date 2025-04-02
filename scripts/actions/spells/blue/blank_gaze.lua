-----------------------------------
-- Spell: Blank Gaze
-- Removes one beneficial magic effect from an enemy
-- Spell cost: 25 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Light)
-- Blue Magic Points: 2
-- Stat Bonus: None
-- Level: 38
-- Casting Time: 3 seconds
-- Recast Time: 10 seconds
-- Magic Bursts on: Transfixion, Fusion, Light
-- Combos: None
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = invaderXim.ecosystem.BEAST
    params.attribute = invaderXim.mod.INT
    params.skillType = invaderXim.skill.BLUE_MAGIC
    params.effect = invaderXim.effect.NONE
    local resistThreshold = 0.25
    local effect = invaderXim.effect.NONE

    local resist = applyResistanceEffect(caster, target, spell, params)
    if resist >= resistThreshold then
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)

        -- Gaze move
        if target:isFacing(caster) and caster:isFacing(target) then
            effect = target:dispelStatusEffect()
            spell:setMsg(invaderXim.msg.basic.MAGIC_ERASE)
            if effect == invaderXim.effect.NONE then
                spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)
            end
        end
    else
        spell:setMsg(invaderXim.msg.basic.MAGIC_RESIST)
    end

    return effect
end

return spellObject
