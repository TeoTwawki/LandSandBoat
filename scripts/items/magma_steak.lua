-----------------------------------
-- ID: 6071
-- Item: Magma Steak
-- Food Effect: 180 Min, All Races
-----------------------------------
-- Strength +8
-- Attack +23% Cap 180
-- Ranged Attack +23% Cap 180
-- Vermin Killer +5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 6071)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 8)
    target:addMod(invaderXim.mod.FOOD_ATTP, 23)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 180)
    target:addMod(invaderXim.mod.FOOD_RATTP, 23)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 180)
    target:addMod(invaderXim.mod.VERMIN_KILLER, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 8)
    target:delMod(invaderXim.mod.FOOD_ATTP, 23)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 180)
    target:delMod(invaderXim.mod.FOOD_RATTP, 23)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 180)
    target:delMod(invaderXim.mod.VERMIN_KILLER, 5)
end

return itemObject
