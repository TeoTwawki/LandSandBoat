-----------------------------------
-- Binary Absorption
-- Steals hp
-- Type: Magical
-- Utsusemi/Blink absorb: 1 Shadows
-- Range: Melee
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    -- time to drain HP. 100-200
    local power = math.random(0, 101) + 100
    local dmg = invaderXim.mobskills.mobFinalAdjustments(power, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK, invaderXim.mobskills.shadowBehavior.NUMSHADOWS_1)

        skill:setMsg(invaderXim.mobskills.mobPhysicalDrainMove(mob, target, skill, invaderXim.mobskills.drainType.HP, dmg))

    return dmg
end

return mobskillObject
