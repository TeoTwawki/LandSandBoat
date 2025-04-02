-----------------------------------
-- Trinary Absorption
-- Attempts to absorb one buff from a single target, or otherwise steals HP.
-- Type: Magical
-- Utsusemi/Blink absorb: 1 Shadows
-- Range: Melee
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if
        mob:isMobType(invaderXim.mobType.NOTORIOUS) or
        target:hasStatusEffect(invaderXim.effect.BATTLEFIELD)
    then
        return 0
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    -- time to drain HP. 50-100
    local power = math.random(0, 151) + 150
    local dmg = invaderXim.mobskills.mobFinalAdjustments(power, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK, invaderXim.mobskills.shadowBehavior.NUMSHADOWS_1)

    skill:setMsg(invaderXim.mobskills.mobPhysicalDrainMove(mob, target, skill, invaderXim.mobskills.drainType.HP, dmg))

    return dmg
end

return mobskillObject
