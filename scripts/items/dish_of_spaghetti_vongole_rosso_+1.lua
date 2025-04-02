-----------------------------------
-- ID: 5198
-- Item: Dish of Spaghetti Vongole Rosso +1
-- Food Effect: 60Min, All Races
-----------------------------------
-- Health % 20
-- Health Cap 95
-- Vitality 2
-- Mind -1
-- Defense % 25
-- Defense Cap 35
-- Store TP 6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5198)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 20)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 95)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.MND, -1)
    target:addMod(invaderXim.mod.FOOD_DEFP, 25)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 35)
    target:addMod(invaderXim.mod.STORETP, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 20)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 95)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.MND, -1)
    target:delMod(invaderXim.mod.FOOD_DEFP, 25)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 35)
    target:delMod(invaderXim.mod.STORETP, 6)
end

return itemObject
