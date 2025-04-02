-----------------------------------
-- ID: 5709
-- Item: Cotton Candy
-- Food Effect: 5 Min, All Races
-----------------------------------
-- MP % 10 Cap 200
-- MP Healing 3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5709)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 10)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 200)
    target:addMod(invaderXim.mod.MPHEAL, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 10)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 200)
    target:delMod(invaderXim.mod.MPHEAL, 3)
end

return itemObject
