-----------------------------------
-- ID: 5711
-- Item: kitron_snow_cone
-- Food Effect: 5 Min, All Races
-----------------------------------
-- MP +15% (cap 15)
-- Intelligence 2
-- Wind resistance +5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5711)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 15)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 15)
    target:addMod(invaderXim.mod.INT, 2)
    target:addMod(invaderXim.mod.WIND_MEVA, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 15)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 15)
    target:delMod(invaderXim.mod.INT, 2)
    target:delMod(invaderXim.mod.WIND_MEVA, 5)
end

return itemObject
