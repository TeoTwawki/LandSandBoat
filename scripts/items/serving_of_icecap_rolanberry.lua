-----------------------------------
-- ID: 4556
-- Item: serving_of_icecap_rolanberry
-- Food Effect: 180Min, All Races
-----------------------------------
-- Magic % 19
-- Magic Cap 55
-- Intelligence 2
-- Wind Res 5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4556)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 19)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 55)
    target:addMod(invaderXim.mod.INT, 2)
    target:addMod(invaderXim.mod.WIND_MEVA, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 19)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 55)
    target:delMod(invaderXim.mod.INT, 2)
    target:delMod(invaderXim.mod.WIND_MEVA, 5)
end

return itemObject
