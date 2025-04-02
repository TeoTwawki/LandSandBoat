-----------------------------------
-- ID: 5601
-- Item: Balik Sis +1
-- Food Effect: 60Min, All Races
-----------------------------------
-- Dexterity 5
-- Mind -2
-- Attack % 15
-- Attack Cap 70
-- Ranged ACC 2
-- Ranged ATT % 15
-- Ranged ATT Cap 70
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5601)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 5)
    target:addMod(invaderXim.mod.MND, -2)
    target:addMod(invaderXim.mod.FOOD_ATTP, 15)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 70)
    target:addMod(invaderXim.mod.RACC, 2)
    target:addMod(invaderXim.mod.FOOD_RATTP, 15)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 70)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 5)
    target:delMod(invaderXim.mod.MND, -2)
    target:delMod(invaderXim.mod.FOOD_ATTP, 15)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 70)
    target:delMod(invaderXim.mod.RACC, 2)
    target:delMod(invaderXim.mod.FOOD_RATTP, 15)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 70)
end

return itemObject
