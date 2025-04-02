-----------------------------------
-- ID: 5142
-- Item: serving_of_bison_steak
-- Food Effect: 180Min, All Races
-----------------------------------
-- Strength 6
-- Agility 1
-- Intelligence -3
-- Attack % 18
-- Attack Cap 90
-- Ranged ATT % 18
-- Ranged ATT Cap 90
-- Lizard Killer 5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5142)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 6)
    target:addMod(invaderXim.mod.AGI, 1)
    target:addMod(invaderXim.mod.INT, -3)
    target:addMod(invaderXim.mod.FOOD_ATTP, 18)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 90)
    target:addMod(invaderXim.mod.FOOD_RATTP, 18)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 90)
    target:addMod(invaderXim.mod.LIZARD_KILLER, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 6)
    target:delMod(invaderXim.mod.AGI, 1)
    target:delMod(invaderXim.mod.INT, -3)
    target:delMod(invaderXim.mod.FOOD_ATTP, 18)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 90)
    target:delMod(invaderXim.mod.FOOD_RATTP, 18)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 90)
    target:delMod(invaderXim.mod.LIZARD_KILLER, 5)
end

return itemObject
