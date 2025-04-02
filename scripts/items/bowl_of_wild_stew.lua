-----------------------------------
-- ID: 4589
-- Item: Bowl of Wild Stew
-- Food Effect: 240Min, All Races
-----------------------------------
-- Strength 4
-- Agility 1
-- Vitality 2
-- Intelligence -2
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
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 4589)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 4)
    target:addMod(invaderXim.mod.AGI, 1)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.INT, -2)
    target:addMod(invaderXim.mod.FOOD_ATTP, 25)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 50)
    target:addMod(invaderXim.mod.FOOD_RATTP, 25)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 50)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 4)
    target:delMod(invaderXim.mod.AGI, 1)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.INT, -2)
    target:delMod(invaderXim.mod.FOOD_ATTP, 25)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 50)
    target:delMod(invaderXim.mod.FOOD_RATTP, 25)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 50)
end

return itemObject
