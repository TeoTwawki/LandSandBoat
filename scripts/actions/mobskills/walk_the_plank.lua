-----------------------------------
-- Walk the Plank (Lion)
-- AoE Damage, Bind, Knockback, dispel
-- Type: Physical (AoE)
-- Skillchain Properties: Light/Distortion
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 2
    local ftp    = 0.3
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, mob:getWeaponDmg() * ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING, info.hitslanded)

    target:dispelStatusEffect()
    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING)

    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.BIND, 1, 0, 20)

    return dmg
end

return mobskillObject
