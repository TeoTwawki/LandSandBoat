-----------------------------------
-- Rear Lasers
-- Fires aft lasers at players behind user. Additional effects: Petrification
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if target:isBehind(mob) then
        return 0
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PETRIFICATION, 1, 0, 30))

    return invaderXim.effect.PETRIFICATION
end

return mobskillObject
