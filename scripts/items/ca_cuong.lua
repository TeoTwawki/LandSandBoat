-----------------------------------
-- ID: 5474
-- Item: Ca Cuong
-- Food Effect: 5 Min, Mithra only
-----------------------------------
-- Dexterity +2
-- Mind -4
-- Agility +2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.RAW_FISH)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5474)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 2)
    target:addMod(invaderXim.mod.MND, -4)
    target:addMod(invaderXim.mod.AGI, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 2)
    target:delMod(invaderXim.mod.MND, -4)
    target:delMod(invaderXim.mod.AGI, 2)
end

return itemObject
