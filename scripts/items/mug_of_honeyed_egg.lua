-----------------------------------
-- ID: 5739
-- Item: mug_of_honeyed_egg
-- Food Effect: 30Min, All Races
-----------------------------------
-- MP 8
-- Intelligence 1
-- MP recovered while healing 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5739)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 8)
    target:addMod(invaderXim.mod.INT, 1)
    target:addMod(invaderXim.mod.MPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 8)
    target:delMod(invaderXim.mod.INT, 1)
    target:delMod(invaderXim.mod.MPHEAL, 1)
end

return itemObject
