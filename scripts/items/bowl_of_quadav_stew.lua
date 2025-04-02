-----------------------------------
-- ID: 4569
-- Item: Bowl of Quadav Stew
-- Food Effect: 180Min, All Races
-----------------------------------
-- Agility -4
-- Vitality 2
-- Defense % 17
-- Defense Cap 60
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4569)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AGI, -4)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.FOOD_DEFP, 17)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 60)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AGI, -4)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.FOOD_DEFP, 17)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 60)
end

return itemObject
