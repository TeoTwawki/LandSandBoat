-----------------------------------
-- ID: 5941
-- Item: Bar of Campfire Chocolate
-- Food Effect: 30Min, All Races
-----------------------------------
-- Mind +1
-- MP recovered while healing +2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5941)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.MND, 1)
    target:addMod(invaderXim.mod.MPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.MND, 1)
    target:delMod(invaderXim.mod.MPHEAL, 2)
end

return itemObject
