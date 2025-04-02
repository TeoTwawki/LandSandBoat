-----------------------------------
-- ID: 4362
-- Item: lizard_egg
-- Food Effect: 5Min, All Races
-----------------------------------
-- Health 5
-- Magic 5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 4362)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 5)
    target:addMod(invaderXim.mod.FOOD_MP, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 5)
    target:delMod(invaderXim.mod.FOOD_MP, 5)
end

return itemObject
