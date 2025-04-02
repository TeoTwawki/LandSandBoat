-----------------------------------
-- ID: 4391
-- Item: Bretzel
-- Food Effect: 3Min, All Races
-----------------------------------
-- Magic % 8
-- Magic Cap 55
-- Vitality 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 180, 4391)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 8)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 55)
    target:addMod(invaderXim.mod.VIT, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 8)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 55)
    target:delMod(invaderXim.mod.VIT, 2)
end

return itemObject
