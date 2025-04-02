-----------------------------------
-- ID: 6601
-- Item: Omelette Sandwich
-- Food Effect: 30minutes, All Races
-----------------------------------
-- HP +11% (Max. 150)
-- VIT +7
-- MND +7
-- Accuracy +11% (Max. 80)
-- DEF +11% (Max. 120)
-- Enmity +4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 6601)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 11)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 150)
    target:addMod(invaderXim.mod.VIT, 7)
    target:addMod(invaderXim.mod.MND, 7)
    target:addMod(invaderXim.mod.FOOD_ACCP, 11)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 80)
    target:addMod(invaderXim.mod.FOOD_DEFP, 11)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 120)
    target:addMod(invaderXim.mod.ENMITY, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 11)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 150)
    target:delMod(invaderXim.mod.VIT, 7)
    target:delMod(invaderXim.mod.MND, 7)
    target:delMod(invaderXim.mod.FOOD_ACCP, 11)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 80)
    target:delMod(invaderXim.mod.FOOD_DEFP, 11)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 120)
    target:delMod(invaderXim.mod.ENMITY, 4)
end

return itemObject
