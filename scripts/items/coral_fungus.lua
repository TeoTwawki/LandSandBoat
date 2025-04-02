-----------------------------------
-- ID: 4450
-- Item: coral_fungus
-- Food Effect: 5Min, All Races
-----------------------------------
-- Strength -4
-- Mind 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 4450)
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
