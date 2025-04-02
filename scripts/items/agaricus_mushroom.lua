-----------------------------------
-- ID: 5680
-- Item: agaricus mushroom
-- Food Effect: 5 Min, All Races
-----------------------------------
-- STR -4
-- MND +2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5680)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, -4)
    target:addMod(invaderXim.mod.MND, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, -4)
    target:delMod(invaderXim.mod.MND, 2)
end

return itemObject
