-----------------------------------
-- ID: 4371
-- Item: slice_of_grilled_hare
-- Food Effect: 180Min, All Races
-----------------------------------
-- Strength 2
-- Intelligence -1
-- Attack % 30
-- Attack Cap 15
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4371)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 2)
    target:addMod(invaderXim.mod.INT, -1)
    target:addMod(invaderXim.mod.FOOD_ATTP, 30)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 15)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 2)
    target:delMod(invaderXim.mod.INT, -1)
    target:delMod(invaderXim.mod.FOOD_ATTP, 30)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 15)
end

return itemObject
