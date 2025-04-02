-----------------------------------
-- ID: 5691
-- Item: plate_of_shrimp_sushi
-- Food Effect: 30Min, All Races
-----------------------------------
-- Vitality 1
-- Defense 5
-- Accuracy % 14 (cap 68)
-- Ranged Accuracy % 14 (cap 68)
-- Resist sleep +1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5691)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.VIT, 1)
    target:addMod(invaderXim.mod.DEF, 5)
    target:addMod(invaderXim.mod.FOOD_ACCP, 14)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 68)
    target:addMod(invaderXim.mod.FOOD_RACCP, 14)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 68)
    target:addMod(invaderXim.mod.SLEEPRES, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.VIT, 1)
    target:delMod(invaderXim.mod.DEF, 5)
    target:delMod(invaderXim.mod.FOOD_ACCP, 14)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 68)
    target:delMod(invaderXim.mod.FOOD_RACCP, 14)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 68)
    target:delMod(invaderXim.mod.SLEEPRES, 1)
end

return itemObject
