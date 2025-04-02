-----------------------------------
-- ID: 5600
-- Item: Balik Sis
-- Food Effect: 30Min, All Races
-----------------------------------
-- Dexterity 4
-- Mind -2
-- Attack % 13
-- Attack Cap 65
-- Ranged ACC 1
-- Ranged ATT % 13
-- Ranged ATT Cap 65
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5600)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 4)
    target:addMod(invaderXim.mod.MND, -2)
    target:addMod(invaderXim.mod.FOOD_ATTP, 13)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 65)
    target:addMod(invaderXim.mod.RACC, 1)
    target:addMod(invaderXim.mod.FOOD_RATTP, 13)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 65)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 4)
    target:delMod(invaderXim.mod.MND, -2)
    target:delMod(invaderXim.mod.FOOD_ATTP, 13)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 65)
    target:delMod(invaderXim.mod.RACC, 1)
    target:delMod(invaderXim.mod.FOOD_RATTP, 13)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 65)
end

return itemObject
