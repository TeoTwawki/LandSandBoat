-----------------------------------
-- Granite Skin
-- Description: Enhances defense and guarding skill (nullifies all physical damage from the front).
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    -- This is a special case where the defense boost prevents damage
    -- while the attacker is in front of the defender at the given subpower angle
    local duration = invaderXim.mobskills.calculateDuration(skill:getTP(), 60, 90)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.DEFENSE_BOOST, 0, 0, duration))

    local effect = mob:getStatusEffect(invaderXim.effect.DEFENSE_BOOST)
    if effect then
        effect:setSubPower(90)
    end

    return invaderXim.effect.DEFENSE_BOOST
end

return mobskillObject
