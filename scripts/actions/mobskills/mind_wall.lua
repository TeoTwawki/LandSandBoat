-----------------------------------
-- Mind Wall
-- Description: Activates a shield to absorb all incoming magical damage.
-- Type: Magical
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getAnimationSub() == 3 then
        return 0
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.MAGIC_SHIELD, 3, 0, 30)
    skill:setMsg(invaderXim.msg.basic.NONE)

    return 0
end

return mobskillObject
