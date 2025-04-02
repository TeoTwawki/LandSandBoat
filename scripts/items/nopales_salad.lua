-----------------------------------
-- ID: 5701
-- Item: nopales_salad
-- Food Effect: 3Hrs, All Races
-----------------------------------
-- Strength 1
-- Agility 6
-- Ranged Accuracy +20
-- Ranged Attack +10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5701)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 1)
    target:addMod(invaderXim.mod.AGI, 6)
    target:addMod(invaderXim.mod.RACC, 20)
    target:addMod(invaderXim.mod.RATT, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 1)
    target:delMod(invaderXim.mod.AGI, 6)
    target:delMod(invaderXim.mod.RACC, 20)
    target:delMod(invaderXim.mod.RATT, 10)
end

return itemObject
