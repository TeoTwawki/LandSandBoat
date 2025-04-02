-----------------------------------
-- ID: 5675
-- Item: Withered Rolanberry
-- Food Effect: 30 Mins, All Races
-----------------------------------
-- Intelligence 1
-- Agility -3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5675)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.INT, 1)
    target:addMod(invaderXim.mod.AGI, -3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.INT, 1)
    target:delMod(invaderXim.mod.AGI, -3)
end

return itemObject
