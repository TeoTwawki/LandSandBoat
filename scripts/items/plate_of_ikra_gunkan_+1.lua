-----------------------------------
-- ID: 5220
-- Item: plate_of_ikra_gunkan_+1
-- Food Effect: 60Min, All Races
-----------------------------------
-- Health 30
-- Magic 12
-- Dexterity 3
-- Mind -1
-- Accuracy % 18
-- Accuracy Cap 30
-- Ranged ACC % 18
-- Ranged ACC Cap 30
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5220)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 30)
    target:addMod(invaderXim.mod.FOOD_MP, 12)
    target:addMod(invaderXim.mod.DEX, 3)
    target:addMod(invaderXim.mod.MND, -1)
    target:addMod(invaderXim.mod.FOOD_ACCP, 18)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 30)
    target:addMod(invaderXim.mod.FOOD_RACCP, 18)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 30)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 30)
    target:delMod(invaderXim.mod.FOOD_MP, 12)
    target:delMod(invaderXim.mod.DEX, 3)
    target:delMod(invaderXim.mod.MND, -1)
    target:delMod(invaderXim.mod.FOOD_ACCP, 18)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 30)
    target:delMod(invaderXim.mod.FOOD_RACCP, 18)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 30)
end

return itemObject
