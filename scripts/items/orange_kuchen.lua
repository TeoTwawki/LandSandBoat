-----------------------------------
-- ID: 4393
-- Item: orange_kuchen
-- Food Effect: 180Min, All Races
-----------------------------------
-- Magic % 13
-- Magic Cap 75
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4393)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 13)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 75)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 13)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 75)
end

return itemObject
