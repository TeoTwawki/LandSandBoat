-----------------------------------
-- ID: 4443
-- Item: cobalt_jellyfish
-- Food Effect: 5 Min, Mithra only
-----------------------------------
-- Dexterity 1
-- Mind -3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.RAW_FISH)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 4443)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 1)
    target:addMod(invaderXim.mod.MND, -3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 1)
    target:delMod(invaderXim.mod.MND, -3)
end

return itemObject
