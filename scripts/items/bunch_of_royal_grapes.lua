-----------------------------------
-- ID: 5541
-- Item: Bunch of Royal Grapes
-- Food Effect: 5Min, All Races
-----------------------------------
-- Agility -6
-- Intelligence 4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5541)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AGI, -6)
    target:addMod(invaderXim.mod.INT, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AGI, -6)
    target:delMod(invaderXim.mod.INT, 4)
end

return itemObject
