-----------------------------------
-- ID: 4437
-- Item: slice_of_roast_mutton
-- Food Effect: 180Min, All Races
-----------------------------------
-- Strength 3
-- Intelligence -1
-- Attack % 27
-- Attack Cap 30
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4437)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 3)
    target:addMod(invaderXim.mod.INT, -1)
    target:addMod(invaderXim.mod.FOOD_ATTP, 27)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 30)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 3)
    target:delMod(invaderXim.mod.INT, -1)
    target:delMod(invaderXim.mod.FOOD_ATTP, 27)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 30)
end

return itemObject
