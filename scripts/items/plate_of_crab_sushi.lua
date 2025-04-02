-----------------------------------
-- ID: 5721
-- Item: plate_of_crab_sushi
-- Food Effect: 30Min, All Races
-----------------------------------
-- Vitality 1
-- Defense 10
-- Accuracy % 13 (cap 64)
-- Resist Sleep +1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5721)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.VIT, 1)
    target:addMod(invaderXim.mod.DEF, 10)
    target:addMod(invaderXim.mod.FOOD_ACCP, 13)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 64)
    target:addMod(invaderXim.mod.SLEEPRES, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.VIT, 1)
    target:delMod(invaderXim.mod.DEF, 10)
    target:delMod(invaderXim.mod.FOOD_ACCP, 13)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 64)
    target:delMod(invaderXim.mod.SLEEPRES, 1)
end

return itemObject
