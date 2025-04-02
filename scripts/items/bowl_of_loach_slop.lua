-----------------------------------
-- ID: 5669
-- Item: Bowl of Loach Slop
-- Food Effect: 3 Hrs, All Races
-----------------------------------
-- TODO: Make Group Effect
-- Accuracy 7% Cap 15
-- Ranged Accuracy 7% Cap 15
-- HP 7% Cap 15
-- Evasion 3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5669)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_ACCP, 7)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 15)
    target:addMod(invaderXim.mod.FOOD_RACCP, 7)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 15)
    target:addMod(invaderXim.mod.FOOD_HPP, 7)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 15)
    target:addMod(invaderXim.mod.EVA, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_ACCP, 7)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 15)
    target:delMod(invaderXim.mod.FOOD_RACCP, 7)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 15)
    target:delMod(invaderXim.mod.FOOD_HPP, 7)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 15)
    target:delMod(invaderXim.mod.EVA, 3)
end

return itemObject
