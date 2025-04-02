-----------------------------------
-- Snatch Morsel
-- Steals food effect
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    if target:hasStatusEffect(invaderXim.effect.FOOD) then
        -- 99% sure retail doesn't do this. Uncomment if you want it to happen.
        -- local foodID = target:getStatusEffect(invaderXim.effect.FOOD):getSubType()
        -- local duration = target:getStatusEffect(invaderXim.effect.FOOD):getDuration()
        -- mob:addStatusEffect(invaderXim.effect.FOOD, 0, 0, duration, foodID) -- Gives Colibri the players food.
        target:delStatusEffectSilent(invaderXim.effect.FOOD)
        skill:setMsg(invaderXim.msg.basic.SKILL_ERASE)
    else
        skill:setMsg(invaderXim.msg.basic.SKILL_MISS) -- no effect
    end

    return invaderXim.effect.FOOD
end

return mobskillObject
