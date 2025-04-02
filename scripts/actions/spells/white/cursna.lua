-----------------------------------
-- Spell: Cursna
-- Removes curse and bane from target.
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local curse  = target:getStatusEffect(invaderXim.effect.CURSE_I)
    local curse2 = target:getStatusEffect(invaderXim.effect.CURSE_II)
    local bane   = target:getStatusEffect(invaderXim.effect.BANE)
    local bonus  = caster:getMod(invaderXim.mod.ENHANCES_CURSNA) + target:getMod(invaderXim.mod.ENHANCES_CURSNA_RCVD)
    local skill  = caster:getSkillLevel(invaderXim.skill.HEALING_MAGIC)
    local final  = nil

    -- https://www.bg-wiki.com/ffxi/Cursna, https://wiki.ffo.jp/html/1962.html
    local power = (10 + (skill / 30)) * (1 + (bonus / 100))

    spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)
    if target:hasStatusEffect(invaderXim.effect.DOOM) and power > math.random(1, 100) then
        -- remove doom
        final = invaderXim.effect.DOOM
        target:delStatusEffect(invaderXim.effect.DOOM)
        spell:setMsg(invaderXim.msg.basic.NARROWLY_ESCAPE)
    elseif curse ~= nil and curse2 ~= nil and bane ~= nil then
        target:delStatusEffect(invaderXim.effect.CURSE_I)
        target:delStatusEffect(invaderXim.effect.CURSE_II)
        target:delStatusEffect(invaderXim.effect.BANE)
        final = invaderXim.effect.CURSE_II
        spell:setMsg(invaderXim.msg.basic.MAGIC_REMOVE_EFFECT)
    elseif curse ~= nil and bane ~= nil then
        target:delStatusEffect(invaderXim.effect.CURSE_I)
        target:delStatusEffect(invaderXim.effect.BANE)
        final = invaderXim.effect.CURSE_I
        spell:setMsg(invaderXim.msg.basic.MAGIC_REMOVE_EFFECT)
    elseif curse2 ~= nil and bane ~= nil then
        target:delStatusEffect(invaderXim.effect.CURSE_II)
        target:delStatusEffect(invaderXim.effect.BANE)
        final = invaderXim.effect.CURSE_II
        spell:setMsg(invaderXim.msg.basic.MAGIC_REMOVE_EFFECT)
    elseif curse ~= nil then
        target:delStatusEffect(invaderXim.effect.CURSE_I)
        final = invaderXim.effect.CURSE_I
        spell:setMsg(invaderXim.msg.basic.MAGIC_REMOVE_EFFECT)
    elseif curse2 ~= nil then
        target:delStatusEffect(invaderXim.effect.CURSE_II)
        final = invaderXim.effect.CURSE_II
        spell:setMsg(invaderXim.msg.basic.MAGIC_REMOVE_EFFECT)
    elseif bane ~= nil then
        target:delStatusEffect(invaderXim.effect.BANE)
        final = invaderXim.effect.BANE
        spell:setMsg(invaderXim.msg.basic.MAGIC_REMOVE_EFFECT)
    end

    return final
end

return spellObject
