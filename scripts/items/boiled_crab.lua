-----------------------------------
-- ID: 4456
-- Item: Boiled Crab
-- Food Effect: 30Min, All Races
-----------------------------------
-- Vitality 2
-- defense % 27
-- defense % 50
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4456)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.FOOD_DEFP, 27)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 50)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.FOOD_DEFP, 27)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 50)
end

return itemObject
