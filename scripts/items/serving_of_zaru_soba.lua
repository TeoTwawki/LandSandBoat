-----------------------------------
-- ID: 5727
-- Item: serving_of_zaru_soba
-- Food Effect: 30Min?, All Races
-----------------------------------
-- Agility 3
-- HP % 12 (cap 180)
-- Resist Sleep +5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5727)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AGI, 3)
    target:addMod(invaderXim.mod.FOOD_HPP, 12)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 180)
    target:addMod(invaderXim.mod.SLEEPRES, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AGI, 3)
    target:delMod(invaderXim.mod.FOOD_HPP, 12)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 180)
    target:delMod(invaderXim.mod.SLEEPRES, 5)
end

return itemObject
