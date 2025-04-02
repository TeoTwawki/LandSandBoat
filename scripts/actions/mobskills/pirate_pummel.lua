-----------------------------------
-- Pirate Pummel (Lion)
-- Damage and burn effect
-- Type: Physical
-- Skillchain Properties: Fusion/Impaction
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    -- TODO: verify exact number of hits from this ability
    local numhits = 2
    local accmod = 1
    local ftp    = 0.3
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, mob:getWeaponDmg() * ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING, info.hitslanded)

    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BURN, 1, 0, 20)

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING)

    return dmg
end

return mobskillObject
