-----------------------------------
-- Horrid Roar (Fafnir, Cynoprosopi, Smok)
-- Dispels a single buff at random which could be food.  Lowers Enmity.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if not target:isInfront(mob, 128) then
        return 1
    elseif mob:getAnimationSub() == 1 then
        return 1
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local dispel = target:dispelStatusEffect(bit.bor(invaderXim.effectFlag.DISPELABLE, invaderXim.effectFlag.FOOD))

    if dispel == invaderXim.effect.NONE then
        -- no effect
        skill:setMsg(invaderXim.msg.basic.SKILL_NO_EFFECT) -- no effect
    else
        skill:setMsg(invaderXim.msg.basic.SKILL_ERASE)
    end

    mob:lowerEnmity(target, 20)

    return dispel
end

return mobskillObject
