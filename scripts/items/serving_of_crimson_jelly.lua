-----------------------------------
-- ID: 5144
-- Item: serving_of_crimson_jelly
-- Food Effect: 180Min, All Races
-----------------------------------
-- Magic % 12
-- Magic Cap 85
-- Intelligence 6
-- Magic Regen While Healing 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5144)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 12)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 85)
    target:addMod(invaderXim.mod.INT, 6)
    target:addMod(invaderXim.mod.MPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 12)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 85)
    target:delMod(invaderXim.mod.INT, 6)
    target:delMod(invaderXim.mod.MPHEAL, 2)
end

return itemObject
