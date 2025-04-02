-----------------------------------
-- Binary Tap
-- Attempts to absorb two buffs from a single target, or otherwise steals HP.
-- Type: Magical
-- Utsusemi/Blink absorb: Ignores Shadows
-- Range: Melee
-- Notes: Can be any (positive) buff, including food. Will drain about 100HP if it can't take any buffs
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    -- try to drain buff
    local effectFirst = mob:stealStatusEffect(target, invaderXim.effectFlag.DISPELABLE)
    local effectSecond = mob:stealStatusEffect(target, invaderXim.effectFlag.DISPELABLE)

    if effectFirst ~= 0 then
        local count = 1

        if effectSecond ~= 0 then
            count = count + 1
        end

        skill:setMsg(invaderXim.msg.basic.EFFECT_DRAINED)

        return count
    else
        -- time to drain HP. 100-200
        local power = math.random(0, 101) + 100
        local dmg   = invaderXim.mobskills.mobFinalAdjustments(power, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

        skill:setMsg(invaderXim.mobskills.mobPhysicalDrainMove(mob, target, skill, invaderXim.mobskills.drainType.HP, dmg))
        return dmg
    end
end

return mobskillObject
