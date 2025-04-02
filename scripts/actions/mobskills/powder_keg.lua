-----------------------------------
-- Powder Keg (Lion)
-- Conal damage, knock back, defense down, and magic defense down.
-- Type: Physical
-- Skillchain Properties: Fusion/Compression
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

    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.DEFENSE_DOWN, 20, 0, 60)
    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.MAGIC_DEF_DOWN, 20, 0, 60)

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING)

    return dmg
end

return mobskillObject
