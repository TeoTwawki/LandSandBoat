-----------------------------------
-- ID: 5662
-- Item: Dragon Fruit
-- Food Effect: 5 Mins, All Races
-----------------------------------
-- Intelligence 4
-- Agility -6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5662)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.INT, 4)
    target:addMod(invaderXim.mod.AGI, -6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.INT, 4)
    target:delMod(invaderXim.mod.AGI, -6)
end

return itemObject
