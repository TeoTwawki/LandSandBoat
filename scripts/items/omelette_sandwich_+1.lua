-----------------------------------
-- ID: 6602
-- Item: Omelette Sandwich +1
-- Food Effect: 30minutes, All Races
-----------------------------------
-- HP +11% (Max. 155)
-- VIT +8
-- MND +8
-- Accuracy +11% (Max. 85)
-- DEF +11% (Max. 125)
-- Enmity +5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 6602)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 11)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 155)
    target:addMod(invaderXim.mod.VIT, 8)
    target:addMod(invaderXim.mod.MND, 8)
    target:addMod(invaderXim.mod.FOOD_ACCP, 11)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 85)
    target:addMod(invaderXim.mod.FOOD_DEFP, 11)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 125)
    target:addMod(invaderXim.mod.ENMITY, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 11)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 155)
    target:delMod(invaderXim.mod.VIT, 8)
    target:delMod(invaderXim.mod.MND, 8)
    target:delMod(invaderXim.mod.FOOD_ACCP, 11)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 85)
    target:delMod(invaderXim.mod.FOOD_DEFP, 11)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 125)
    target:delMod(invaderXim.mod.ENMITY, 5)
end

return itemObject
