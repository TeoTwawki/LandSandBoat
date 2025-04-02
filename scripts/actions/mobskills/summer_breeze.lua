-----------------------------------
-- Summer Breeze
-- Description: AoE Erase invaderXim.effect. (If nothing to Erase, it instead gains Regain.)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local erase = mob:eraseStatusEffect()

    if erase ~= invaderXim.effect.NONE then
        skill:setMsg(invaderXim.msg.basic.SKILL_ERASE)
        return erase
    else
        skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.REGAIN, 10, 3, 60))
        return invaderXim.effect.REGAIN
    end
end

return mobskillObject
