-----------------------------------
-- ID: 5713
-- Item: orange_snow_cone
-- Food Effect: 5 Min, All Races
-----------------------------------
-- MP +20% (cap 20)
-- AGI -1
-- INT +1
-- Wind resistance +5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5713)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 20)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 20)
    target:addMod(invaderXim.mod.AGI, -1)
    target:addMod(invaderXim.mod.INT, 1)
    target:addMod(invaderXim.mod.WIND_MEVA, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 20)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 20)
    target:delMod(invaderXim.mod.AGI, -1)
    target:delMod(invaderXim.mod.INT, 1)
    target:delMod(invaderXim.mod.WIND_MEVA, 5)
end

return itemObject
