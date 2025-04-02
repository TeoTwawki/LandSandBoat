-----------------------------------
-- Mix: Para-b-gone - Removes Paralysis.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    if target:hasStatusEffect(invaderXim.effect.PARALYSIS) then
        skill:setMsg(invaderXim.msg.basic.SKILL_ERASE)
        target:delStatusEffect(invaderXim.effect.PARALYSIS)
        return invaderXim.effect.PARALYSIS
    else
        skill:setMsg(invaderXim.msg.basic.NO_EFFECT)
    end
end

return mobskillObject
