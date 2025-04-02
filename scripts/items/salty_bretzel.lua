-----------------------------------
-- ID: 5182
-- Item: salty_bretzel
-- Food Effect: 5Min, All Races
-----------------------------------
-- Magic % 8
-- Magic Cap 60
-- Vitality 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5182)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 8)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 60)
    target:addMod(invaderXim.mod.VIT, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 8)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 60)
    target:delMod(invaderXim.mod.VIT, 2)
end

return itemObject
