-----------------------------------
-- ID: 5602
-- Item: dish_of_hydra_kofte
-- Food Effect: 180Min, All Races
-----------------------------------
-- Strength 7
-- Intelligence -3
-- Attack % 20
-- Attack Cap 150
-- Defense % 25
-- Defense Cap 70
-- Ranged ATT % 20
-- Ranged ATT Cap 150
-- Poison Resist 5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5602)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 7)
    target:addMod(invaderXim.mod.INT, -3)
    target:addMod(invaderXim.mod.FOOD_ATTP, 20)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 150)
    target:addMod(invaderXim.mod.FOOD_DEFP, 25)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 70)
    target:addMod(invaderXim.mod.FOOD_RATTP, 20)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 150)
    target:addMod(invaderXim.mod.POISONRES, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 7)
    target:delMod(invaderXim.mod.INT, -3)
    target:delMod(invaderXim.mod.FOOD_ATTP, 20)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 150)
    target:delMod(invaderXim.mod.FOOD_DEFP, 25)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 70)
    target:delMod(invaderXim.mod.FOOD_RATTP, 20)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 150)
    target:delMod(invaderXim.mod.POISONRES, 5)
end

return itemObject
