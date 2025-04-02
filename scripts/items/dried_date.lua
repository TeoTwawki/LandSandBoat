-----------------------------------
-- ID: 5567
-- Item: dried_date
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health 10
-- Magic 20
-- Agility -1
-- Intelligence 3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5567)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 10)
    target:addMod(invaderXim.mod.FOOD_MP, 20)
    target:addMod(invaderXim.mod.AGI, -1)
    target:addMod(invaderXim.mod.INT, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 10)
    target:delMod(invaderXim.mod.FOOD_MP, 20)
    target:delMod(invaderXim.mod.AGI, -1)
    target:delMod(invaderXim.mod.INT, 3)
end

return itemObject
