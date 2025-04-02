-----------------------------------
-- ID: 4547
-- Item: Bowl of Boiled Cockatrice
-- Food Effect: 180Min, All Races
-----------------------------------
-- Strength 5
-- Agility 2
-- Intelligence -2
-- Mind 1
-- Attack % 22
-- Attack Cap 60
-- Ranged ATT % 22
-- Ranged ATT Cap 60
-- Resist petrify +4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4547)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 5)
    target:addMod(invaderXim.mod.AGI, 2)
    target:addMod(invaderXim.mod.INT, -2)
    target:addMod(invaderXim.mod.MND, 1)
    target:addMod(invaderXim.mod.FOOD_ATTP, 22)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 60)
    target:addMod(invaderXim.mod.FOOD_RATTP, 22)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 60)
    target:addMod(invaderXim.mod.PETRIFYRES, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 5)
    target:delMod(invaderXim.mod.AGI, 2)
    target:delMod(invaderXim.mod.INT, -2)
    target:delMod(invaderXim.mod.MND, 1)
    target:delMod(invaderXim.mod.FOOD_ATTP, 22)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 60)
    target:delMod(invaderXim.mod.FOOD_RATTP, 22)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 60)
    target:delMod(invaderXim.mod.PETRIFYRES, 4)
end

return itemObject
