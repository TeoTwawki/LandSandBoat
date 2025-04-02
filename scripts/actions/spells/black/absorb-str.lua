-----------------------------------
-- Spell: Absorb-STR
-- Steals an enemy's strength.
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    if
        target:hasStatusEffect(invaderXim.effect.STR_DOWN) or
        caster:hasStatusEffect(invaderXim.effect.STR_BOOST)
    then
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT) -- no effect
    else
        -- local dINT = caster:getStat(invaderXim.mod.INT) - target:getStat(invaderXim.mod.INT)
        local params = {}
        params.diff = nil
        params.attribute = invaderXim.mod.INT
        params.skillType = invaderXim.skill.DARK_MAGIC
        params.bonus = 0
        params.effect = nil
        local resist = applyResistanceEffect(caster, target, spell, params)
        if resist <= 0.125 then
            spell:setMsg(invaderXim.msg.basic.MAGIC_RESIST)
        else
            spell:setMsg(invaderXim.msg.basic.MAGIC_ABSORB_STR)
            caster:addStatusEffect(invaderXim.effect.STR_BOOST, invaderXim.settings.main.ABSORB_SPELL_AMOUNT * resist * ((100 + (caster:getMod(invaderXim.mod.AUGMENTS_ABSORB))) / 100), invaderXim.settings.main.ABSORB_SPELL_TICK, invaderXim.settings.main.ABSORB_SPELL_AMOUNT * invaderXim.settings.main.ABSORB_SPELL_TICK) -- caster gains STR
            target:addStatusEffect(invaderXim.effect.STR_DOWN, invaderXim.settings.main.ABSORB_SPELL_AMOUNT * resist * ((100 + (caster:getMod(invaderXim.mod.AUGMENTS_ABSORB))) / 100), invaderXim.settings.main.ABSORB_SPELL_TICK, invaderXim.settings.main.ABSORB_SPELL_AMOUNT * invaderXim.settings.main.ABSORB_SPELL_TICK)    -- target loses STR
        end
    end

    return invaderXim.effect.STR_DOWN
end

return spellObject
