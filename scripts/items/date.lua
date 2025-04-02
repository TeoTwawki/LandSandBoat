-----------------------------------
-- ID: 5566
-- Item: Date
-- Food Effect: 5 Mins, All Races
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
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5566)
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
