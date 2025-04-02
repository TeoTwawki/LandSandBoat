-----------------------------------
-- Spell: Aspir
-- Drain functions only on skill level!!
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    if target:isUndead() then
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT) -- No effect
        return 0
    end

    --calculate raw damage (unknown function  -> only dark skill though) - using http://www.bluegartr.com/threads/44518-Drain-Calculations
    -- also have small constant to account for 0 dark skill
    local dmg = 5 + 0.375 * caster:getSkillLevel(invaderXim.skill.DARK_MAGIC)
    --get resist multiplier (1x if no resist)
    local params = {}
    params.diff = caster:getStat(invaderXim.mod.INT)-target:getStat(invaderXim.mod.INT)
    params.attribute = invaderXim.mod.INT
    params.skillType = invaderXim.skill.DARK_MAGIC
    params.bonus = 1.0
    local resist = applyResistanceEffect(caster, target, spell, params)
    --get the resisted damage
    dmg = dmg * resist
    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster, spell, target, dmg)
    --add in target adjustment
    dmg = dmg * invaderXim.spells.damage.calculateNukeAbsorbOrNullify(target, spell:getElement())
    --add in final adjustments

    dmg = dmg * invaderXim.settings.main.DARK_POWER

    if dmg < 0 then
        dmg = 0
    end

    if target:getMP() > dmg then
        caster:addMP(dmg)
        target:delMP(dmg)
    else
        dmg = target:getMP()
        caster:addMP(dmg)
        target:delMP(dmg)
    end

    return dmg
end

return spellObject
