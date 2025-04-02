-----------------------------------
-- ID: 5555
-- Item: serving_of_flurry_courante
-- Food Effect: 240Min, All Races
-----------------------------------
-- Magic % 19
-- Magic Cap 65
-- Intelligence 2
-- Magic Regen While Healing 1
-- Wind Resist 5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5555)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 19)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 65)
    target:addMod(invaderXim.mod.INT, 2)
    target:addMod(invaderXim.mod.MPHEAL, 1)
    target:addMod(invaderXim.mod.WIND_MEVA, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 19)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 65)
    target:delMod(invaderXim.mod.INT, 2)
    target:delMod(invaderXim.mod.MPHEAL, 1)
    target:delMod(invaderXim.mod.WIND_MEVA, 5)
end

return itemObject
