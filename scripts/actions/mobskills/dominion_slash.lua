-----------------------------------
-- Dominion Slash
-- Description: Performs an area of effect slashing weaponskill. Additional effect: Silence
-- Type: Physical
-- 2-3 Shadows
-- Range: Unknown radial
-- One source also mentions that it "can dispel important buffs."
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    -- TODO: Can skillchain?  Unknown property.

    local numhits = 1
    local accmod = 1
    local ftp    = 3.25 -- fTP and fTP scaling unknown. TODO: capture ftp
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT, 0, 0, 0)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING, invaderXim.mobskills.shadowBehavior.NUMSHADOWS_2)

    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SILENCE, 1, 0, 60)

    -- Due to conflicting information, making the dispel resistable.  Correct/tweak if wrong.
    -- Dispel has no status effect or resistance gear, so 0s instead of nulls.
    local resist = invaderXim.mobskills.applyPlayerResistance(mob, 0, target, mob:getStat(invaderXim.mod.INT)-target:getStat(invaderXim.mod.INT), 0, invaderXim.element.LIGHT)
    if resist > 0.0625 then
        target:dispelStatusEffect()
    end

    -- TODO: Dispel message

    -- Damage is HIGHLY conflicting.  Witnessed anywhere from 300 to 900.
    -- TP DMG VARIES can sort of account for this, but I feel like it's still not right.
    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING)
    return dmg
end

return mobskillObject
