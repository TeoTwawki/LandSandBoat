-----------------------------------
-- Mix: Eye Drops - Removes Blindness.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    if target:hasStatusEffect(invaderXim.effect.BLINDNESS) then
        skill:setMsg(invaderXim.msg.basic.SKILL_ERASE)
        target:delStatusEffect(invaderXim.effect.BLINDNESS)
        return invaderXim.effect.BLINDNESS
    else
        skill:setMsg(invaderXim.msg.basic.NO_EFFECT)
    end
end

return mobskillObject
