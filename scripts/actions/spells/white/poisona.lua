-----------------------------------
-- Spell: Poisona
-- Removes poison from target.
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    if target:delStatusEffect(invaderXim.effect.POISON) then
        spell:setMsg(invaderXim.msg.basic.MAGIC_REMOVE_EFFECT)
    else
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)
    end

    return invaderXim.effect.POISON
end

return spellObject
