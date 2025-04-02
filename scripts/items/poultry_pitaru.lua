-----------------------------------
-- ID: 5890
-- Item: poultry_pitaru
-- Food Effect: 30 Min, All Races
-----------------------------------
-- MP +7% (cap 110)
-- Increases rate of magic skill gains by 40%
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5890)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 7)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 110)
    target:addMod(invaderXim.mod.MAGIC_SKILLUP_RATE, 40)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 7)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 110)
    target:delMod(invaderXim.mod.MAGIC_SKILLUP_RATE, 40)
end

return itemObject
