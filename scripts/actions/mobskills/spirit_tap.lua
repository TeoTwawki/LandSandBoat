-----------------------------------
-- Spirit Tap
-- Attempts to absorb one buff from a single target, or otherwise steals HP.
-- Type: Magical
-- Utsusemi/Blink absorb: Ignores Shadows
-- Range: Melee
-- Notes: Can be any (positive) buff, including food. Will drain about 100HP if it can't take any buffs
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:isMobType(invaderXim.mobType.NOTORIOUS) then
        return 1
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    -- try to drain buff
    local effect = mob:stealStatusEffect(target, invaderXim.effectFlag.DISPELABLE)
    local dmg

    if effect ~= 0 then
        skill:setMsg(invaderXim.msg.basic.EFFECT_DRAINED)
        return 1
    else
        -- time to drain HP. 50-100
        local power = math.random(0, 51) + 50
        dmg = invaderXim.mobskills.mobFinalAdjustments(power, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

        skill:setMsg(invaderXim.mobskills.mobPhysicalDrainMove(mob, target, skill, invaderXim.mobskills.drainType.HP, dmg))
    end

    return dmg
end

return mobskillObject
