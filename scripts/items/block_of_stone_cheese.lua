-----------------------------------
-- ID: 4460
-- Item: Block of Stone Cheese
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health +6% (cap 40)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4460)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 6)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 40)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 6)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 40)
end

return itemObject
