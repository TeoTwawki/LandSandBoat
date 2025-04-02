-----------------------------------
-- ID: 5702
-- Item: Nopales Salad +1
-- Food Effect: 3Hrs, All Races
-----------------------------------
-- Strength 2
-- Agility 7
-- Ranged Accuracy +25
-- Ranged Attack +15
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5702)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 2)
    target:addMod(invaderXim.mod.AGI, 7)
    target:addMod(invaderXim.mod.RACC, 25)
    target:addMod(invaderXim.mod.RATT, 15)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 2)
    target:delMod(invaderXim.mod.AGI, 7)
    target:delMod(invaderXim.mod.RACC, 25)
    target:delMod(invaderXim.mod.RATT, 15)
end

return itemObject
