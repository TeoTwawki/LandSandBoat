-----------------------------------
--  Zephyr Mantle
--  Description: Creates shadow images that each absorb a single attack directed at you.
--  Type: Magical (Wind)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local base = math.random(4, 10)

    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.BLINK, base, 0, 180))
    return invaderXim.effect.BLINK
end

return mobskillObject
