-----------------------------------
-- ID: 5464
-- Item: Kaplumbaga
-- Food Effect: 5Min, Mithra only
-----------------------------------
-- Dexterity 3
-- Mind -5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.RAW_FISH)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5464)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 3)
    target:addMod(invaderXim.mod.MND, -5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 3)
    target:delMod(invaderXim.mod.MND, -5)
end

return itemObject
