-----------------------------------
-- ID: 5454
-- Item: Mercanbaligi
-- Food Effect: 5Min, Mithra only
-----------------------------------
-- Dexterity 4
-- Mind -6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.RAW_FISH)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5454)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 4)
    target:addMod(invaderXim.mod.MND, -6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 4)
    target:delMod(invaderXim.mod.MND, -6)
end

return itemObject
