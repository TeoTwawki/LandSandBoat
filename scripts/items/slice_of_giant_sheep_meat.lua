-----------------------------------
-- ID: 4372
-- Item: slice_of_giant_sheep_meat
-- Food Effect: 5Min, Galka only
-----------------------------------
-- Strength 2
-- Intelligence -4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.RAW_MEAT)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 4372)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 2)
    target:addMod(invaderXim.mod.INT, -4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 2)
    target:delMod(invaderXim.mod.INT, -4)
end

return itemObject
