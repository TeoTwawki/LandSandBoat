-----------------------------------
-- ID: 4409
-- Item: hard-boiled_egg
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health 10
-- Magic 10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4409)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 10)
    target:addMod(invaderXim.mod.FOOD_MP, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 10)
    target:delMod(invaderXim.mod.FOOD_MP, 10)
end

return itemObject
