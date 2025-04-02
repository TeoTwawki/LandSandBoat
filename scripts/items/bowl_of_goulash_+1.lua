-----------------------------------
-- ID: 5751
-- Item: bowl_of_goulash_+1
-- Food Effect: 4Hrs, All Races
-----------------------------------
-- VIT +4
-- INT -2
-- Accuracy +11% (cap 58)
-- DEF +11% (cap 35)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5751)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.VIT, 4)
    target:addMod(invaderXim.mod.INT, -2)
    target:addMod(invaderXim.mod.FOOD_ACCP, 11)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 58)
    target:addMod(invaderXim.mod.FOOD_DEFP, 11)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 35)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.VIT, 4)
    target:delMod(invaderXim.mod.INT, -2)
    target:delMod(invaderXim.mod.FOOD_ACCP, 11)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 58)
    target:delMod(invaderXim.mod.FOOD_DEFP, 11)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 35)
end

return itemObject
