-----------------------------------
-- ID: 4342
-- Item: steamed_crab
-- Food Effect: 60Min, All Races
-----------------------------------
-- Vitality 3
-- Defense % 27 (cap 65)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 4342)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.VIT, 3)
    target:addMod(invaderXim.mod.FOOD_DEFP, 27)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 65)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.VIT, 3)
    target:delMod(invaderXim.mod.FOOD_DEFP, 27)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 65)
end

return itemObject
