-----------------------------------
-- Spell: Erase
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local effect = target:eraseStatusEffect()

    if effect == invaderXim.effect.NONE then
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT) -- no effect
    else
        spell:setMsg(invaderXim.msg.basic.MAGIC_ERASE)
    end

    return effect
end

return spellObject
