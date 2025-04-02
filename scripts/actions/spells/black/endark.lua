-----------------------------------
-- Spell: Endark
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local effect = invaderXim.effect.ENDARK
    local magicskill = target:getSkillLevel(invaderXim.skill.DARK_MAGIC)
    local potency = (magicskill / 8) + 12.5

    if target:addStatusEffect(effect, potency, 0, 180) then
        spell:setMsg(invaderXim.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)
    end

    return effect
end

return spellObject
