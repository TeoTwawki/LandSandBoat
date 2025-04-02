-----------------------------------
-- ID: 5221
-- Item: pitcher_of_homemade_herbal_tea
-- Food Effect: 30Min, All Races
-----------------------------------
-- Accuracy +12% (cap 80)
-- Attack +10% (cap 40)
-- Ranged Accuracy +12% (cap 80)
-- Ranged Attack +10% (cap 40)
-- hHP +1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5221)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_ACCP, 12)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 80)
    target:addMod(invaderXim.mod.FOOD_ATTP, 10)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 40)
    target:addMod(invaderXim.mod.FOOD_RACCP, 12)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 80)
    target:addMod(invaderXim.mod.FOOD_RATTP, 10)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 40)
    target:addMod(invaderXim.mod.HPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_ACCP, 12)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 80)
    target:delMod(invaderXim.mod.FOOD_ATTP, 10)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 40)
    target:delMod(invaderXim.mod.FOOD_RACCP, 12)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 80)
    target:delMod(invaderXim.mod.FOOD_RATTP, 10)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 40)
    target:delMod(invaderXim.mod.HPHEAL, 1)
end

return itemObject
