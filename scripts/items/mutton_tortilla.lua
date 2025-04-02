-----------------------------------
-- ID: 4506
-- Item: mutton_tortilla
-- Food Effect: 30Min, All Races
-----------------------------------
-- Magic 10
-- Strength 3
-- Vitality 1
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
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4506)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 10)
    target:addMod(invaderXim.mod.STR, 3)
    target:addMod(invaderXim.mod.VIT, 1)
    target:addMod(invaderXim.mod.INT, -1)
    target:addMod(invaderXim.mod.FOOD_ATTP, 27)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 30)
    target:addMod(invaderXim.mod.FOOD_RATTP, 27)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 30)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 10)
    target:delMod(invaderXim.mod.STR, 3)
    target:delMod(invaderXim.mod.VIT, 1)
    target:delMod(invaderXim.mod.INT, -1)
    target:delMod(invaderXim.mod.FOOD_ATTP, 27)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 30)
    target:delMod(invaderXim.mod.FOOD_RATTP, 27)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 30)
end

return itemObject
