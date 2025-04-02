-----------------------------------
-- ID: 4518
-- Item: strip_of_sheep_jerky
-- Food Effect: 60Min, All Races
-----------------------------------
-- Strength 3
-- Intelligence -1
-- Attack % 23
-- Attack Cap 35
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 4518)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 3)
    target:addMod(invaderXim.mod.INT, -1)
    target:addMod(invaderXim.mod.FOOD_ATTP, 23)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 35)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 3)
    target:delMod(invaderXim.mod.INT, -1)
    target:delMod(invaderXim.mod.FOOD_ATTP, 23)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 35)
end

return itemObject
