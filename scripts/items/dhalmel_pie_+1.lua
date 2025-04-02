-----------------------------------
-- ID: 4322
-- Item: dhalmel_pie_+1
-- Food Effect: 60Min, All Races
-----------------------------------
-- Health 25
-- Strength 4
-- Agility 2
-- Vitality 1
-- Intelligence -2
-- Mind 1
-- Attack % 25
-- Attack Cap 50
-- Ranged ATT % 25
-- Ranged ATT Cap 50
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 4322)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 25)
    target:addMod(invaderXim.mod.STR, 4)
    target:addMod(invaderXim.mod.AGI, 2)
    target:addMod(invaderXim.mod.VIT, 1)
    target:addMod(invaderXim.mod.INT, -2)
    target:addMod(invaderXim.mod.MND, 1)
    target:addMod(invaderXim.mod.FOOD_ATTP, 25)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 50)
    target:addMod(invaderXim.mod.FOOD_RATTP, 25)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 50)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 25)
    target:delMod(invaderXim.mod.STR, 4)
    target:delMod(invaderXim.mod.AGI, 2)
    target:delMod(invaderXim.mod.VIT, 1)
    target:delMod(invaderXim.mod.INT, -2)
    target:delMod(invaderXim.mod.MND, 1)
    target:delMod(invaderXim.mod.FOOD_ATTP, 25)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 50)
    target:delMod(invaderXim.mod.FOOD_RATTP, 25)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 50)
end

return itemObject
