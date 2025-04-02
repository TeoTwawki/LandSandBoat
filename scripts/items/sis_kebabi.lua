-----------------------------------
-- ID: 5598
-- Item: sis_kebabi
-- Food Effect: 30Min, All Races
-----------------------------------
-- Strength 6
-- Vitality -2
-- Intelligence -2
-- Attack % 20
-- Attack Cap 70
-- Ranged ATT % 20
-- Ranged ATT Cap 70
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5598)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 6)
    target:addMod(invaderXim.mod.VIT, -2)
    target:addMod(invaderXim.mod.INT, -2)
    target:addMod(invaderXim.mod.FOOD_ATTP, 20)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 70)
    target:addMod(invaderXim.mod.FOOD_RATTP, 20)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 70)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 6)
    target:delMod(invaderXim.mod.VIT, -2)
    target:delMod(invaderXim.mod.INT, -2)
    target:delMod(invaderXim.mod.FOOD_ATTP, 20)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 70)
    target:delMod(invaderXim.mod.FOOD_RATTP, 20)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 70)
end

return itemObject
