-----------------------------------
-- ID: 5652
-- Item: plate_of_anchovies
-- Food Effect: 3Min, All Races
-----------------------------------
-- Dexterity 1
-- Mind -3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 180, 5652)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 1)
    target:addMod(invaderXim.mod.MND, -3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 1)
    target:delMod(invaderXim.mod.MND, -3)
end

return itemObject
