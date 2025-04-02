-----------------------------------
-- ID: 5603
-- Item: dish_of_hydra_kofte_+1
-- Food Effect: 240Min, All Races
-----------------------------------
-- Strength 8
-- Intelligence -4
-- Attack % 20
-- Attack Cap 160
-- Defense % 25
-- Defense Cap 75
-- Ranged ATT % 20
-- Ranged ATT Cap 160
-- Poison Resist 5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5603)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 8)
    target:addMod(invaderXim.mod.INT, -4)
    target:addMod(invaderXim.mod.FOOD_ATTP, 20)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 160)
    target:addMod(invaderXim.mod.FOOD_DEFP, 25)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 75)
    target:addMod(invaderXim.mod.FOOD_RATTP, 20)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 160)
    target:addMod(invaderXim.mod.POISONRES, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 8)
    target:delMod(invaderXim.mod.INT, -4)
    target:delMod(invaderXim.mod.FOOD_ATTP, 20)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 160)
    target:delMod(invaderXim.mod.FOOD_DEFP, 25)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 75)
    target:delMod(invaderXim.mod.FOOD_RATTP, 20)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 160)
    target:delMod(invaderXim.mod.POISONRES, 5)
end

return itemObject
