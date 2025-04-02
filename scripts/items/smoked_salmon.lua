-----------------------------------
-- ID: 4380
-- Item: smoked_salmon
-- Food Effect: 30Min, All Races
-----------------------------------
-- Dexterity 2
-- Mind -3
-- Ranged Accuracy +1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4380)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 2)
    target:addMod(invaderXim.mod.MND, -3)
    target:addMod(invaderXim.mod.RACC, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 2)
    target:delMod(invaderXim.mod.MND, -3)
    target:delMod(invaderXim.mod.RACC, 1)
end

return itemObject
