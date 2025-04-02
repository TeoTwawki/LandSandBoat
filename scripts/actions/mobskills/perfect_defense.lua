-----------------------------------
-- Perfect Defense
--
-- Description: Reduces damage taken and greatly increases resistance to most status invaderXim.effect.
-- Type: Enhancing
-- Can be dispelled: No
-- Range: Self
-- Notes:
-- Grants immunity to either physical, magical, or ranged damage.
-- Randomly switches immunities starting at 10% health. Accompanied by text
-- "Cease thy struggles...
-- I am immutable...indestructible...impervious...immortal..."
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.PERFECT_DEFENSE, 1, 0, skill:getParam())

    skill:setMsg(invaderXim.msg.basic.USES)
    return invaderXim.effect.PERFECT_DEFENSE
end

return mobskillObject
