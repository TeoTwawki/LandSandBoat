-----------------------------------
-- Fire Blade
-- Description: Applies Enfire and absorbs Fire damage.
-- Type: Enhancing
-- Used only by Kam'lanaut. Enfire aspect adds 70+ to his melee attacks.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.ENFIRE, 65, 0, 60))

    return invaderXim.effect.ENFIRE
end

return mobskillObject
