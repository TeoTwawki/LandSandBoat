-----------------------------------
-- Hex Palm
-- Family: Qutrub
-- Description: Steals HP from targets in front.
-- Type: Magical
-- Utsusemi/Blink absorb: Wipes shadows
-- Range: Front cone
-- Notes: Used only when wielding no weapon.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getAnimationSub() == 1 or mob:getAnimationSub() == 3 then
        return 0
    else
        return 1
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getMainLvl() * 2

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.DARK, 1, invaderXim.mobskills.magicalTpBonus.MAB_BONUS, 1)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    skill:setMsg(invaderXim.mobskills.mobPhysicalDrainMove(mob, target, skill, invaderXim.mobskills.drainType.HP, damage))

    return damage
end

return mobskillObject
