-----------------------------------
-- ID: 4363
-- Item: faerie_apple
-- Food Effect: 5Min, All Races
-----------------------------------
-- Agility -4
-- Intelligence 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 4363)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AGI, -4)
    target:addMod(invaderXim.mod.INT, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AGI, -4)
    target:delMod(invaderXim.mod.INT, 2)
end

return itemObject
