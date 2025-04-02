-----------------------------------
-- ID: 4600
-- Item: lucky_egg
-- Food Effect: 60Min, All Races
-----------------------------------
-- Health 14
-- Magic 14
-- Evasion 10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 4600)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 14)
    target:addMod(invaderXim.mod.FOOD_MP, 14)
    target:addMod(invaderXim.mod.EVA, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 14)
    target:delMod(invaderXim.mod.FOOD_MP, 14)
    target:delMod(invaderXim.mod.EVA, 10)
end

return itemObject
