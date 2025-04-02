-----------------------------------
-- ID: 6069
-- Item: Bowl of Riverfin Soup
-- Food Effect: 3 Hrs, All Races
-----------------------------------
-- Accuracy % 14 Cap 90
-- Ranged Accuracy % 14 Cap 90
-- Attack % 18 Cap 80
-- Ranged Attack % 18 Cap 80
-- Amorph Killer 5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 6069)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_ACCP, 14)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 90)
    target:addMod(invaderXim.mod.FOOD_RACCP, 14)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 90)
    target:addMod(invaderXim.mod.FOOD_ATTP, 18)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 80)
    target:addMod(invaderXim.mod.FOOD_RATTP, 18)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 80)
    target:addMod(invaderXim.mod.AMORPH_KILLER, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_ACCP, 14)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 90)
    target:delMod(invaderXim.mod.FOOD_RACCP, 14)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 90)
    target:delMod(invaderXim.mod.FOOD_ATTP, 18)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 80)
    target:delMod(invaderXim.mod.FOOD_RATTP, 18)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 80)
    target:delMod(invaderXim.mod.AMORPH_KILLER, 5)
end

return itemObject
