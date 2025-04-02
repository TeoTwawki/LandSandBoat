-----------------------------------
-- ID: 5554
-- Item: serving_of_squirrels_delight
-- Food Effect: 4Hrs, All Races
-----------------------------------
-- MP % 13 (cap 95)
-- MP Recovered While Healing 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5554)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 13)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 95)
    target:addMod(invaderXim.mod.MPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 13)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 95)
    target:delMod(invaderXim.mod.MPHEAL, 2)
end

return itemObject
