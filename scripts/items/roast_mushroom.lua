-----------------------------------
-- ID: 4410
-- Item: roast_mushroom
-- Food Effect: 30minutes, All Races
-----------------------------------
-- Magic Points 10
-- Strength -1
-- Mind 3
-- Enmity -1
-- MP Recovered While Healing 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4410)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 10)
    target:addMod(invaderXim.mod.STR, -1)
    target:addMod(invaderXim.mod.MND, 3)
    target:addMod(invaderXim.mod.ENMITY, -1)
    target:addMod(invaderXim.mod.MPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 10)
    target:delMod(invaderXim.mod.STR, -1)
    target:delMod(invaderXim.mod.MND, 3)
    target:delMod(invaderXim.mod.ENMITY, -1)
    target:delMod(invaderXim.mod.MPHEAL, 2)
end

return itemObject
