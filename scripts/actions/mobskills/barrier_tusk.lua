-----------------------------------
-- Barrier Tusk
-- Enhances defense and magic defense
-- Marids will only use Barrier Tusk if at least one of their tusks remain unbroken
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getAnimationSub() == 0 then
        return 0
    else
        return 1
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.MAGIC_DEF_BOOST, 30, 0, 90)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.DEFENSE_BOOST, 30, 0, 90))

    return invaderXim.effect.DEFENSE_BOOST
end

return mobskillObject
