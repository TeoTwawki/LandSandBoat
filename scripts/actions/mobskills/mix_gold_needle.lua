-----------------------------------
-- Mix: Gold Needle - Removes Petrification.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    if target:hasStatusEffect(invaderXim.effect.PETRIFICATION) then
        skill:setMsg(invaderXim.msg.basic.SKILL_ERASE)
        target:delStatusEffect(invaderXim.effect.PETRIFICATION)
        return invaderXim.effect.PETRIFICATION
    else
        skill:setMsg(invaderXim.msg.basic.NO_EFFECT)
    end
end

return mobskillObject
