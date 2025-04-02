-----------------------------------
-- ID: 4294
-- Item: serving_of_medicinal_quus
-- Food Effect: 240Min, All Races
-----------------------------------
-- Dexterity 1
-- Mind -1
-- Ranged ACC % 7
-- Ranged ACC Cap 15
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 4294)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 1)
    target:addMod(invaderXim.mod.MND, -1)
    target:addMod(invaderXim.mod.FOOD_RACCP, 7)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 15)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 1)
    target:delMod(invaderXim.mod.MND, -1)
    target:delMod(invaderXim.mod.FOOD_RACCP, 7)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 15)
end

return itemObject
