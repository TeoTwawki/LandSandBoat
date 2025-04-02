-----------------------------------
-- ID: 5892
-- Item: b.e.w._pitaru
-- Food Effect: 30 Min, All Races
-----------------------------------
-- MP +9% (cap 130)
-- Increases rate of magic skill gains by 80%
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5892)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 9)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 130)
    target:addMod(invaderXim.mod.MAGIC_SKILLUP_RATE, 80)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 9)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 130)
    target:delMod(invaderXim.mod.MAGIC_SKILLUP_RATE, 80)
end

return itemObject
