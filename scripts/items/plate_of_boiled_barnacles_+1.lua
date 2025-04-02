-----------------------------------
-- ID: 5981
-- Item: Plate of Boiled Barnacles +1
-- Food Effect: 60 Mins, All Races
-----------------------------------
-- Charisma -2
-- Defense % 26 Cap 135
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5981)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.CHR, -2)
    target:addMod(invaderXim.mod.FOOD_DEFP, 26)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 135)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.CHR, -2)
    target:delMod(invaderXim.mod.FOOD_DEFP, 26)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 135)
end

return itemObject
