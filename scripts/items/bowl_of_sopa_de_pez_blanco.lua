-----------------------------------
-- ID: 4601
-- Item: Bowl of Sopa de Pez Blanco
-- Food Effect: 180Min, All Races
-----------------------------------
-- Health 12
-- Dexterity 6
-- Mind -4
-- Accuracy 3
-- Ranged ACC % 7
-- Ranged ACC Cap 10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4601)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 12)
    target:addMod(invaderXim.mod.DEX, 6)
    target:addMod(invaderXim.mod.MND, -4)
    target:addMod(invaderXim.mod.ACC, 3)
    target:addMod(invaderXim.mod.FOOD_RACCP, 7)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 12)
    target:delMod(invaderXim.mod.DEX, 6)
    target:delMod(invaderXim.mod.MND, -4)
    target:delMod(invaderXim.mod.ACC, 3)
    target:delMod(invaderXim.mod.FOOD_RACCP, 7)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 10)
end

return itemObject
