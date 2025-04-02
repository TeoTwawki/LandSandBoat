-----------------------------------
-- ID: 5889
-- Item: stuffed_pitaru
-- Food Effect: 30Min, All Races
-----------------------------------
-- MP +6% (cap 100)
-- Increases rate of magic skill gains by 20%
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5889)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 6)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 100)
    target:addMod(invaderXim.mod.MAGIC_SKILLUP_RATE, 20)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 6)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 100)
    target:delMod(invaderXim.mod.MAGIC_SKILLUP_RATE, 20)
end

return itemObject
