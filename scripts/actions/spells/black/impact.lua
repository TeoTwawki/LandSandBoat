-----------------------------------
-- Spell: Impact
-- Deals dark damage to an enemy and
-- decreases all 7 base stats by 20%
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.attribute = invaderXim.mod.INT
    params.bonus = 1.0
    params.diff = caster:getStat(invaderXim.mod.INT)-target:getStat(invaderXim.mod.INT)
    params.dmg = 939
    params.effect = nil
    params.hasMultipleTargetReduction = false
    params.multiplier = 2.335
    params.resistBonus = 1.0
    params.skillType = invaderXim.skill.ELEMENTAL_MAGIC

    local resist = applyResistanceEffect(caster, target, spell, params)
    local duration = 180 * resist -- BG wiki suggests only duration gets effected by resist, not stat amount.

    -- Todo: loop to avoid repeatedly doing same thing for each stat
    local strLoss = ((target:getStat(invaderXim.mod.STR) / 100) * 20) -- Should be 20%
    local dexLoss = ((target:getStat(invaderXim.mod.DEX) / 100) * 20)
    local vitLoss = ((target:getStat(invaderXim.mod.VIT) / 100) * 20)
    local agiLoss = ((target:getStat(invaderXim.mod.AGI) / 100) * 20)
    local intLoss = ((target:getStat(invaderXim.mod.INT) / 100) * 20)
    local mndLoss = ((target:getStat(invaderXim.mod.MND) / 100) * 20)
    local chrLoss = ((target:getStat(invaderXim.mod.CHR) / 100) * 20)

    if not target:hasStatusEffect(invaderXim.effect.STR_DOWN) then
        target:addStatusEffect(invaderXim.effect.STR_DOWN, strLoss, 0, duration)
    end

    if not target:hasStatusEffect(invaderXim.effect.DEX_DOWN) then
        target:addStatusEffect(invaderXim.effect.DEX_DOWN, dexLoss, 0, duration)
    end

    if not target:hasStatusEffect(invaderXim.effect.VIT_DOWN) then
        target:addStatusEffect(invaderXim.effect.VIT_DOWN, vitLoss, 0, duration)
    end

    if not target:hasStatusEffect(invaderXim.effect.AGI_DOWN) then
        target:addStatusEffect(invaderXim.effect.AGI_DOWN, agiLoss, 0, duration)
    end

    if not target:hasStatusEffect(invaderXim.effect.INT_DOWN) then
        target:addStatusEffect(invaderXim.effect.INT_DOWN, intLoss, 0, duration)
    end

    if not target:hasStatusEffect(invaderXim.effect.MND_DOWN) then
        target:addStatusEffect(invaderXim.effect.MND_DOWN, mndLoss, 0, duration)
    end

    if not target:hasStatusEffect(invaderXim.effect.CHR_DOWN) then
        target:addStatusEffect(invaderXim.effect.CHR_DOWN, chrLoss, 0, duration)
    end

    -- Calculate raw damage
    local dmg = calculateMagicDamage(caster, target, spell, params)
    -- Get the resisted damage
    dmg = dmg * resist
    -- Add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster, spell, target, dmg)
    -- Add in target adjustment
    dmg = dmg * invaderXim.spells.damage.calculateNukeAbsorbOrNullify(target, spell:getElement())
    -- Add in final adjustments
    dmg = finalMagicAdjustments(caster, target, spell, dmg)

    return dmg
end

return spellObject
