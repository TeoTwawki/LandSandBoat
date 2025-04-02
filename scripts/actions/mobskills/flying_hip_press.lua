-----------------------------------
--  Flying Hip Press
--  Description: Deals Wind damage to enemies within area of effect.
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 15' radial
-----------------------------------

---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local cap = 300

    -- Bugbear Matman has stronger Flying Hip Press
    if mob:getPool() == 562 then
        cap = math.random(300, 700)
    end

    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.333, 1.2, invaderXim.element.WIND, cap)

    local dmg = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.WIND, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.WIND)
    return dmg
end

return mobskillObject
