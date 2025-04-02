-----------------------------------
-- ID: 4414
-- Item: rolanberry_pie
-- Food Effect: 30Min, All Races
-----------------------------------
-- Magic 50
-- Agility -1
-- Intelligence 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4414)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 50)
    target:addMod(invaderXim.mod.AGI, -1)
    target:addMod(invaderXim.mod.INT, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 50)
    target:delMod(invaderXim.mod.AGI, -1)
    target:delMod(invaderXim.mod.INT, 2)
end

return itemObject
