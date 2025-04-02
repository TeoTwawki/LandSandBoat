-----------------------------------
-- ID: 5656
-- Item: coffeecake_muffin_+1
-- Food Effect: 1Hr, All Races
-----------------------------------
-- Mind 2
-- Strength -1
-- MP % 10 (cap 90)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5656)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.MND, 2)
    target:addMod(invaderXim.mod.STR, -1)
    target:addMod(invaderXim.mod.FOOD_MPP, 10)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 90)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.MND, 2)
    target:delMod(invaderXim.mod.STR, -1)
    target:delMod(invaderXim.mod.FOOD_MPP, 10)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 90)
end

return itemObject
