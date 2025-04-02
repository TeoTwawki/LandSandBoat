-----------------------------------
-- Spell: Silena
-- Removes silence and mute from target.
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    if target:delStatusEffect(invaderXim.effect.SILENCE) then
        spell:setMsg(invaderXim.msg.basic.MAGIC_REMOVE_EFFECT)
    else
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)
    end

    return invaderXim.effect.SILENCE
end

return spellObject
