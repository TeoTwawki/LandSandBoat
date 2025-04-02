-----------------------------------
--  Dark Spore
--
--  Description: Unleashes a torrent of black spores in a fan-shaped area of effect, dealing dark damage to targets. Additional effect: Blind
--  Type: Magical Dark (Element)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BLINDNESS, 15, 3, 120)

    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.25, 2, invaderXim.element.DARK, 800)

    local dmg = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.DARK, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.DARK)
    return dmg
end

return mobskillObject
