-----------------------------------
-- ID: 4377
-- Item: slice_of_coeurl_meat
-- Food Effect: 5Min, Galka only
-----------------------------------
-- Strength 5
-- Intelligence -7
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.RAW_MEAT)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 4377)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 5)
    target:addMod(invaderXim.mod.INT, -7)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 5)
    target:delMod(invaderXim.mod.INT, -7)
end

return itemObject
