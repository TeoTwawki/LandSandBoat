-----------------------------------
-- ID: 5710
-- Item: Berry Snowcone
-- Food Effect: 5 Min, All Races
-----------------------------------
-- MP % 30 Cap 30
-- Intelligence 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5710)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 30)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 30)
    target:addMod(invaderXim.mod.INT, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 30)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 30)
    target:delMod(invaderXim.mod.INT, 1)
end

return itemObject
