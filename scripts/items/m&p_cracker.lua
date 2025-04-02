-----------------------------------
-- ID: 5640
-- Item: M&P Cracker
-- Food Effect: 3Min, All Races
-----------------------------------
-- Vitality 5
-- Mind -5
-- Defense % 25
-- Attack Cap 154
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 180, 5640)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.VIT, 5)
    target:addMod(invaderXim.mod.MND, -5)
    target:addMod(invaderXim.mod.FOOD_DEFP, 25)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 154)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.VIT, 5)
    target:delMod(invaderXim.mod.MND, -5)
    target:delMod(invaderXim.mod.FOOD_DEFP, 25)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 154)
end

return itemObject
