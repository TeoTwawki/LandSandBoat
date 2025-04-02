-----------------------------------
-- ID: 5219
-- Item: plate_of_ikra_gunkan
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health 30
-- Magic 10
-- Dexterity 3
-- Mind -2
-- Accuracy % 18
-- Accuracy Cap 28
-- Ranged ACC % 18
-- Ranged ACC Cap 28
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5219)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 30)
    target:addMod(invaderXim.mod.FOOD_MP, 10)
    target:addMod(invaderXim.mod.DEX, 3)
    target:addMod(invaderXim.mod.MND, -2)
    target:addMod(invaderXim.mod.FOOD_ACCP, 18)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 28)
    target:addMod(invaderXim.mod.FOOD_RACCP, 18)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 28)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 30)
    target:delMod(invaderXim.mod.FOOD_MP, 10)
    target:delMod(invaderXim.mod.DEX, 3)
    target:delMod(invaderXim.mod.MND, -2)
    target:delMod(invaderXim.mod.FOOD_ACCP, 18)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 28)
    target:delMod(invaderXim.mod.FOOD_RACCP, 18)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 28)
end

return itemObject
