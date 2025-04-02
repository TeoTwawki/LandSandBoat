-----------------------------------
-- ID: 4499
-- Item: loaf_of_iron_bread
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health 4
-- Vitality 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4499)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 4)
    target:addMod(invaderXim.mod.VIT, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 4)
    target:delMod(invaderXim.mod.VIT, 1)
end

return itemObject
