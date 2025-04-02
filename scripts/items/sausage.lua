-----------------------------------
-- ID: 4578
-- Item: sausage
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health % 3 (cap 130)
-- Strength 3
-- Intelligence -1
-- Attack % 27
-- Attack Cap 30
-- Ranged ATT % 27
-- Ranged ATT Cap 30
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4578)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 3)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 130)
    target:addMod(invaderXim.mod.STR, 3)
    target:addMod(invaderXim.mod.INT, -1)
    target:addMod(invaderXim.mod.FOOD_ATTP, 27)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 30)
    target:addMod(invaderXim.mod.FOOD_RATTP, 27)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 30)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 3)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 130)
    target:delMod(invaderXim.mod.STR, 3)
    target:delMod(invaderXim.mod.INT, -1)
    target:delMod(invaderXim.mod.FOOD_ATTP, 27)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 30)
    target:delMod(invaderXim.mod.FOOD_RATTP, 27)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 30)
end

return itemObject
