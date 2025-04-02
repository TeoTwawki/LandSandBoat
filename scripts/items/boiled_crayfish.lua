-----------------------------------
-- ID: 4535
-- Item: Boiled Crayfish
-- Food Effect: 30Min, All Races
-----------------------------------
-- defense % 30
-- defense % 25
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4535)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_DEFP, 30)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 25)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_DEFP, 30)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 25)
end

return itemObject
