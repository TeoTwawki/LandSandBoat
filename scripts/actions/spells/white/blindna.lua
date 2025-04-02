-----------------------------------
-- Spell: Blindna
-- Removes blindness from target.
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    if target:delStatusEffect(invaderXim.effect.BLINDNESS) then
        spell:setMsg(invaderXim.msg.basic.MAGIC_REMOVE_EFFECT)
    else
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)
    end

    return invaderXim.effect.BLINDNESS
end

return spellObject
