-----------------------------------
-- ID: 4374
-- Item: sleepshroom
-- Food Effect: 5Min, All Races
-----------------------------------
-- Strength -3
-- Mind 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 4374)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, -3)
    target:addMod(invaderXim.mod.MND, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, -3)
    target:delMod(invaderXim.mod.MND, 1)
end

return itemObject
