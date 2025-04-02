-----------------------------------
-- ID: 5639
-- Item: Skewer of M&P Chicken
-- Food Effect: 3Min, All Races
-----------------------------------
-- Strength 5
-- Intelligence -5
-- Attack % 25
-- Attack Cap 154
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 180, 5639)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 5)
    target:addMod(invaderXim.mod.INT, -5)
    target:addMod(invaderXim.mod.FOOD_ATTP, 25)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 154)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 5)
    target:delMod(invaderXim.mod.INT, -5)
    target:delMod(invaderXim.mod.FOOD_ATTP, 25)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 154)
end

return itemObject
