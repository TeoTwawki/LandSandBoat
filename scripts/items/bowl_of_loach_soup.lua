-----------------------------------
-- ID: 5671
-- Item: Bowl of Loach Soup
-- Food Effect: 4 Hrs, All Races
-----------------------------------
-- Dexterity 4
-- Agility 4
-- Accuracy 7% Cap 50
-- Ranged Accuracy 7% Cap 50
-- HP 7% Cap 50
-- Evasion 5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5671)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 4)
    target:addMod(invaderXim.mod.AGI, 4)
    target:addMod(invaderXim.mod.FOOD_ACCP, 7)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 50)
    target:addMod(invaderXim.mod.FOOD_RACCP, 7)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 50)
    target:addMod(invaderXim.mod.FOOD_HPP, 7)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 50)
    target:addMod(invaderXim.mod.EVA, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 4)
    target:delMod(invaderXim.mod.AGI, 4)
    target:delMod(invaderXim.mod.FOOD_ACCP, 7)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 50)
    target:delMod(invaderXim.mod.FOOD_RACCP, 7)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 50)
    target:delMod(invaderXim.mod.FOOD_HPP, 7)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 50)
    target:delMod(invaderXim.mod.EVA, 5)
end

return itemObject
