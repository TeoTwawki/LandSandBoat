-----------------------------------
-- Water Blade
-- Description: Applies Enwater and absorbs Water damage.
-- Type: Enhancing
-- Used only by Kam'lanaut. Enwater aspect adds 70+ to his melee attacks.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.ENWATER, 65, 0, 60))

    return invaderXim.effect.ENWATER
end

return mobskillObject
