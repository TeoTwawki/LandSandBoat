-----------------------------------
-- ID: 4573
-- Item: loaf_of_steel_bread
-- Food Effect: 60Min, All Races
-----------------------------------
-- Health 6
-- Vitality 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 4573)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 6)
    target:addMod(invaderXim.mod.VIT, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 6)
    target:delMod(invaderXim.mod.VIT, 1)
end

return itemObject
