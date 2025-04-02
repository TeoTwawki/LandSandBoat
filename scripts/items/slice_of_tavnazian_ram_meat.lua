-----------------------------------
-- ID: 5208
-- Item: slice_of_tavnazian_ram_meat
-- Food Effect: 5Min, Galka only
-----------------------------------
-- Strength 2
-- Mind -4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.RAW_MEAT)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5208)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 2)
    target:addMod(invaderXim.mod.MND, -4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 2)
    target:delMod(invaderXim.mod.MND, -4)
end

return itemObject
