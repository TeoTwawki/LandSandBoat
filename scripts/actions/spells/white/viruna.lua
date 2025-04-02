-----------------------------------
-- Spell: Viruna
-- Removes disease or plague from target.
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    if target:delStatusEffect(invaderXim.effect.DISEASE) then
        spell:setMsg(invaderXim.msg.basic.MAGIC_REMOVE_EFFECT)
        return invaderXim.effect.DISEASE
    elseif target:delStatusEffect(invaderXim.effect.PLAGUE) then
        spell:setMsg(invaderXim.msg.basic.MAGIC_REMOVE_EFFECT)
        return invaderXim.effect.PLAGUE
    else
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)
    end

    return 0
end

return spellObject
