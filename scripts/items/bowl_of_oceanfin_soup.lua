-----------------------------------
-- ID: 6070
-- Item: Bowl of Oceanfin Soup
-- Food Effect: 4 Hrs, All Races
-----------------------------------
-- Accuracy % 15 Cap 95
-- Ranged Accuracy % 15 Cap 95
-- Attack % 19 Cap 85
-- Ranged Attack % 19 Cap 85
-- Amorph Killer 6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 6070)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_ACCP, 15)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 95)
    target:addMod(invaderXim.mod.FOOD_RACCP, 15)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 95)
    target:addMod(invaderXim.mod.FOOD_ATTP, 19)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 85)
    target:addMod(invaderXim.mod.FOOD_RATTP, 19)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 85)
    target:addMod(invaderXim.mod.AMORPH_KILLER, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_ACCP, 15)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 95)
    target:delMod(invaderXim.mod.FOOD_RACCP, 15)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 95)
    target:delMod(invaderXim.mod.FOOD_ATTP, 19)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 85)
    target:delMod(invaderXim.mod.FOOD_RATTP, 19)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 85)
    target:delMod(invaderXim.mod.AMORPH_KILLER, 6)
end

return itemObject
