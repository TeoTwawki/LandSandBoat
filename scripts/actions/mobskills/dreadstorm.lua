-----------------------------------
-- Dreadstorm
--
-- Description: Deals magical damage in an area of effect. Additional effect: Terror
-- Type: Magical
-- Wipes Shadows
-- Range: 13' radial
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getFamily() == 316 then
        local mobSkin = mob:getModelId()

        if mobSkin == 1805 then
            return 0
        else
            return 1
        end
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 4

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.DARK, 2.5, invaderXim.mobskills.magicalTpBonus.MAB_BONUS, 1)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK)
    skill:setMsg(invaderXim.mobskills.mobGazeMove(mob, target, invaderXim.effect.TERROR, 1, 0, 10))

    return damage
end

return mobskillObject
