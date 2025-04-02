-----------------------------------
-- ID: 5146
-- Item: hedgehog_pie
-- Food Effect: 180Min, All Races
-----------------------------------
-- Health 55
-- Strength 6
-- Vitality 2
-- Intelligence -3
-- Mind 3
-- Magic Regen While Healing 2
-- Health Regen While Healing 2
-- Attack % 18
-- Attack Cap 90
-- Accuracy 5
-- Ranged ATT % 18
-- Ranged ATT Cap 90
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5146)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 55)
    target:addMod(invaderXim.mod.STR, 6)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.INT, -3)
    target:addMod(invaderXim.mod.MND, 3)
    target:addMod(invaderXim.mod.HPHEAL, 2)
    target:addMod(invaderXim.mod.MPHEAL, 2)
    target:addMod(invaderXim.mod.FOOD_ATTP, 18)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 90)
    target:addMod(invaderXim.mod.ACC, 5)
    target:addMod(invaderXim.mod.FOOD_RATTP, 18)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 90)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 55)
    target:delMod(invaderXim.mod.STR, 6)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.INT, -3)
    target:delMod(invaderXim.mod.MND, 3)
    target:delMod(invaderXim.mod.HPHEAL, 2)
    target:delMod(invaderXim.mod.MPHEAL, 2)
    target:delMod(invaderXim.mod.FOOD_ATTP, 18)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 90)
    target:delMod(invaderXim.mod.ACC, 5)
    target:delMod(invaderXim.mod.FOOD_RATTP, 18)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 90)
end

return itemObject
