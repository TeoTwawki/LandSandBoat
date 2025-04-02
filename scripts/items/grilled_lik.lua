-----------------------------------
-- ID: 5648
-- Item: Grilled Lik
-- Food Effect: 60 Mins, All Races
-----------------------------------
-- Dexterity 4
-- Mind -3
-- Accuracy +2
-- Attack +8
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5648)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 4)
    target:addMod(invaderXim.mod.MND, -3)
    target:addMod(invaderXim.mod.ACC, 2)
    target:addMod(invaderXim.mod.ATT, 8)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 4)
    target:delMod(invaderXim.mod.MND, -3)
    target:delMod(invaderXim.mod.ACC, 2)
    target:delMod(invaderXim.mod.ATT, 8)
end

return itemObject
