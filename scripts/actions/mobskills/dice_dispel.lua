-----------------------------------
-- Goblin Dice
-- Description: Stun
-- Type: Physical (Blunt)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local effect = target:dispelStatusEffect()
    local effect2 = target:dispelStatusEffect()
    local effect3 = target:dispelStatusEffect()
    local num = 0

    if effect ~= invaderXim.effect.NONE then
        num = num + 1
    end

    if effect2 ~= invaderXim.effect.NONE then
        num = num + 1
    end

    if effect3 ~= invaderXim.effect.NONE then
        num = num + 1
    end

    if num == 0 then
        skill:setMsg(invaderXim.msg.basic.SKILL_NO_EFFECT) -- no effect
    else
        skill:setMsg(invaderXim.msg.basic.DISAPPEAR_NUM)
    end

    return num
end

return mobskillObject
