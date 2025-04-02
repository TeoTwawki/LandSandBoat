-----------------------------------
-- Spell: Paralyna
-- Removes paralysis from target.
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    if target:getStatusEffect(invaderXim.effect.PARALYSIS) ~= nil then
        target:delStatusEffect(invaderXim.effect.PARALYSIS)
        spell:setMsg(invaderXim.msg.basic.MAGIC_REMOVE_EFFECT)
    else
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)
    end

    return invaderXim.effect.PARALYSIS
end

return spellObject
