-----------------------------------
-- ID: 5655
-- Item: coffeecake_muffin
-- Food Effect: 30Min, All Races
-----------------------------------
-- Mind 1
-- Strength -1
-- MP % 10 (cap 85)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5655)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.MND, 1)
    target:addMod(invaderXim.mod.STR, -1)
    target:addMod(invaderXim.mod.FOOD_MPP, 10)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 85)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.MND, 1)
    target:delMod(invaderXim.mod.STR, -1)
    target:delMod(invaderXim.mod.FOOD_MPP, 10)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 85)
end

return itemObject
