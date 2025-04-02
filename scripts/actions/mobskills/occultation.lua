-----------------------------------
-- Occultation
--
-- Description: Creates 25 shadows
-- Type: Magical (Wind)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local base = math.random(10, 25)

    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.BLINK, base, 0, 120))
    return invaderXim.effect.BLINK
end

return mobskillObject
