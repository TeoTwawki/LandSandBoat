-----------------------------------
-- ID: 5722
-- Item: plate_of_crab_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------
-- Vitality 2
-- Defense 15
-- Accuracy % 14 (cap 68)
-- Resist Sleep +2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5722)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.DEF, 15)
    target:addMod(invaderXim.mod.FOOD_ACCP, 14)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 68)
    target:addMod(invaderXim.mod.SLEEPRES, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.DEF, 15)
    target:delMod(invaderXim.mod.FOOD_ACCP, 14)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 68)
    target:delMod(invaderXim.mod.SLEEPRES, 2)
end

return itemObject
