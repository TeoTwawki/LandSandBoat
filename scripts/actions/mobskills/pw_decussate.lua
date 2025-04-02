-----------------------------------
-- Decussate
--
-- Description: Performs a cross attack on nearby targets.
-- Type: Magical
-- Utsusemi/Blink absorb: 2-3 shadows?
-- Range: Less than or equal to 10.0
-- Notes: Only used by Gulool Ja Ja when below 35% health.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    local mobSkin = mob:getModelId()

    if mobSkin == 1863 then
        return 0
    else
        return 1
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 3

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.EARTH, 1.2, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.EARTH, math.random(2, 3))

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.EARTH)

    return damage
end

return mobskillObject
