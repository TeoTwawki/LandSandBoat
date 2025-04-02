-----------------------------------
-- ID: 4516
-- Item: slice_of_grilled_black_hare
-- Food Effect: 240Min, All Races
-----------------------------------
-- Strength 2
-- Intelligence -1
-- Attack % 20
-- Attack Cap 30
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 4516)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 2)
    target:addMod(invaderXim.mod.INT, -1)
    target:addMod(invaderXim.mod.FOOD_ATTP, 20)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 30)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 2)
    target:delMod(invaderXim.mod.INT, -1)
    target:delMod(invaderXim.mod.FOOD_ATTP, 20)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 30)
end

return itemObject
