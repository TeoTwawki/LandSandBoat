-----------------------------------
-- ID: 5980
-- Item: Plate of Boiled Barnacles
-- Food Effect: 30 Mins, All Races
-----------------------------------
-- Charisma -3
-- Defense % 25 Cap 130
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5980)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.CHR, -3)
    target:addMod(invaderXim.mod.FOOD_DEFP, 25)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 130)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.CHR, -3)
    target:delMod(invaderXim.mod.FOOD_DEFP, 25)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 130)
end

return itemObject
