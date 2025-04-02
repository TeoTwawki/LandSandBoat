-----------------------------------
-- Lightning Blade
-- Description: Applies Enthunder and absorbs Lightning damage.
-- Type: Enhancing
-- Used only by Kam'lanaut. Enthunder aspect adds 70+ to his melee attacks.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.ENTHUNDER, 65, 0, 60))

    return invaderXim.effect.ENTHUNDER
end

return mobskillObject
