-----------------------------------
-- Leeching Current
-- Description: Steals HP with a water current from targets in an area of effect.
-- Type: Magical (Water)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    -- We use a var here so that mobs can use different values
    local base = mob:getLocalVar('leechingCurrent')
    if base == 0 then
        base = 1000
    end

    local damage = base / skill:getTotalTargets()
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.WATER, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)
    target:takeDamage(damage, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.WATER)
    skill:setMsg(invaderXim.mobskills.mobPhysicalDrainMove(mob, target, skill, invaderXim.mobskills.drainType.HP, damage))

    return damage
end

return mobskillObject
