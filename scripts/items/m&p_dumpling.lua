-----------------------------------
-- ID: 5641
-- Item: M&P Dumpling
-- Food Effect: 3Min, All Races
-----------------------------------
-- Intelligence 5
-- Agility -5
-- MP 30
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 180, 5641)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 30)
    target:addMod(invaderXim.mod.INT, 5)
    target:addMod(invaderXim.mod.AGI, -5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 30)
    target:delMod(invaderXim.mod.INT, 5)
    target:delMod(invaderXim.mod.AGI, -5)
end

return itemObject
