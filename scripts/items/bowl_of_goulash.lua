-----------------------------------
-- ID: 5750
-- Item: bowl_of_goulash
-- Food Effect: 3Hrs, All Races
-----------------------------------
-- VIT +3
-- INT -2
-- Accuracy +10% (cap 54)
-- DEF +10% (cap 30)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5750)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.VIT, 3)
    target:addMod(invaderXim.mod.INT, -2)
    target:addMod(invaderXim.mod.FOOD_ACCP, 10)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 54)
    target:addMod(invaderXim.mod.FOOD_DEFP, 10)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 30)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.VIT, 3)
    target:delMod(invaderXim.mod.INT, -2)
    target:delMod(invaderXim.mod.FOOD_ACCP, 10)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 54)
    target:delMod(invaderXim.mod.FOOD_DEFP, 10)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 30)
end

return itemObject
