-----------------------------------
-- ID: 5672
-- Item: dried_berry
-- Food Effect: 3Min, All Races
-----------------------------------
-- Agility -3
-- Intelligence 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 180, 5672)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AGI, -3)
    target:addMod(invaderXim.mod.INT, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AGI, -3)
    target:delMod(invaderXim.mod.INT, 1)
end

return itemObject
