-----------------------------------
-- ID: 4568
-- Item: moon_ball
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health 3
-- Magic 3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4568)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 3)
    target:addMod(invaderXim.mod.FOOD_MP, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 3)
    target:delMod(invaderXim.mod.FOOD_MP, 3)
end

return itemObject
