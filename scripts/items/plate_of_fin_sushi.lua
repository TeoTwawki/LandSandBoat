-----------------------------------
-- ID: 5665
-- Item: plate_of_fin_sushi
-- Food Effect: 30Min, All Races
-----------------------------------
-- Intelligence 5
-- Accuracy % 16 (cap 76)
-- Ranged Accuracy % 16 (cap 76)
-- Resist Sleep +1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5665)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.INT, 5)
    target:addMod(invaderXim.mod.FOOD_ACCP, 16)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 76)
    target:addMod(invaderXim.mod.FOOD_RACCP, 16)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 76)
    target:addMod(invaderXim.mod.SLEEPRES, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.INT, 5)
    target:delMod(invaderXim.mod.FOOD_ACCP, 16)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 76)
    target:delMod(invaderXim.mod.FOOD_RACCP, 16)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 76)
    target:delMod(invaderXim.mod.SLEEPRES, 2)
end

return itemObject
