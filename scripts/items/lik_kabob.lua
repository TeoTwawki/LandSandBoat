-----------------------------------
-- ID: 5647
-- Item: Lik Kabob
-- Food Effect: 30 Min, All Races
-----------------------------------
-- Dexterity 3
-- Mind -2
-- Accuracy +1
-- Attack 7
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5647)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 3)
    target:addMod(invaderXim.mod.MND, -2)
    target:addMod(invaderXim.mod.ACC, 1)
    target:addMod(invaderXim.mod.ATT, 7)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 3)
    target:delMod(invaderXim.mod.MND, -2)
    target:delMod(invaderXim.mod.ACC, 1)
    target:delMod(invaderXim.mod.ATT, 7)
end

return itemObject
