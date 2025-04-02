-----------------------------------
-- ID: 5681
-- Item: cupid_chocolate
-- Food Effect: 3Hrs, All Races
-----------------------------------
-- Accuracy +10
-- Ranged Accuracy +10
-- Attack 10
-- Ranged Attack 10
-- Store TP +25
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5681)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.ATT, 10)
    target:addMod(invaderXim.mod.RATT, 10)
    target:addMod(invaderXim.mod.ACC, 10)
    target:addMod(invaderXim.mod.RACC, 10)
    target:addMod(invaderXim.mod.STORETP, 25)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.ATT, 10)
    target:delMod(invaderXim.mod.RATT, 10)
    target:delMod(invaderXim.mod.ACC, 10)
    target:delMod(invaderXim.mod.RACC, 10)
    target:delMod(invaderXim.mod.STORETP, 25)
end

return itemObject
