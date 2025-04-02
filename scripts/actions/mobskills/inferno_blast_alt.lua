-----------------------------------
-- Fiery Blast Alt
--
-- Description: Deals fire damage to a single target
-- Type: Magical
-- Utsusemi/Blink absorb: Wipes shadows
-- Notes: Used only by Tiamat, Smok and Ildebrann while flying in place of standard attacks
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, mob:getMainLvl() + 2, invaderXim.element.FIRE, 4, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.FIRE, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.FIRE)
    skill:setMsg(invaderXim.msg.basic.HIT_DMG)

    return damage
end

return mobskillObject
