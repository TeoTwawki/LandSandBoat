-----------------------------------
-- ID: 4519
-- Item: wild_steak
-- Food Effect: 240Min, All Races
-----------------------------------
-- Strength 4
-- Intelligence -2
-- Attack % 25
-- Attack Cap 50
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 4519)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 4)
    target:addMod(invaderXim.mod.INT, -2)
    target:addMod(invaderXim.mod.FOOD_ATTP, 25)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 50)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 4)
    target:delMod(invaderXim.mod.INT, -2)
    target:delMod(invaderXim.mod.FOOD_ATTP, 25)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 50)
end

return itemObject
