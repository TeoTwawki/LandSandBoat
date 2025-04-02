-----------------------------------
-- Vaccine - Removes Plague.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    if target:hasStatusEffect(invaderXim.effect.PLAGUE) then
        skill:setMsg(invaderXim.msg.basic.SKILL_ERASE)
        target:delStatusEffect(invaderXim.effect.PLAGUE)
        return invaderXim.effect.PLAGUE
    else
        skill:setMsg(invaderXim.msg.basic.NO_EFFECT)
    end
end

return mobskillObject
