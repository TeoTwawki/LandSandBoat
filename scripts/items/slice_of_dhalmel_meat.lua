-----------------------------------
-- ID: 4359
-- Item: slice_of_dhalmel_meat
-- Food Effect: 5Min, Galka only
-----------------------------------
-- Strength 3
-- Intelligence -5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.RAW_MEAT)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 4359)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 3)
    target:addMod(invaderXim.mod.INT, -5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 3)
    target:delMod(invaderXim.mod.INT, -5)
end

return itemObject
