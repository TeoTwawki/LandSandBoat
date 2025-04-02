-----------------------------------
-- ID: 4269
-- Item: Bijou Glace
-- Food Effect: 240Min, All Races
-----------------------------------
-- Magic % 13
-- Magic Cap 90
-- Magic Regen While Healing 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 4269)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 13)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 90)
    target:addMod(invaderXim.mod.MPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 13)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 90)
    target:delMod(invaderXim.mod.MPHEAL, 1)
end

return itemObject
