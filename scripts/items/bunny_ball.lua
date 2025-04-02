-----------------------------------
-- ID: 4349
-- Item: Bunny Ball
-- Food Effect: 240Min, All Races
-----------------------------------
-- Health 10
-- Strength 2
-- Vitality 2
-- Intelligence -1
-- Attack % 30 (cap 30)
-- Ranged ATT % 30 (cap 30)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 4349)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 10)
    target:addMod(invaderXim.mod.STR, 2)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.INT, -1)
    target:addMod(invaderXim.mod.FOOD_ATTP, 30)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 30)
    target:addMod(invaderXim.mod.FOOD_RATTP, 30)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 30)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 10)
    target:delMod(invaderXim.mod.STR, 2)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.INT, -1)
    target:delMod(invaderXim.mod.FOOD_ATTP, 30)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 30)
    target:delMod(invaderXim.mod.FOOD_RATTP, 30)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 30)
end

return itemObject
