-----------------------------------
-- ID: 5191
-- Item: dish_of_spaghetti_pescatora
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health % 15
-- Health Cap 150
-- Vitality 3
-- Mind -1
-- Defense % 22
-- Defense Cap 65
-- Store TP 6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5191)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 15)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 150)
    target:addMod(invaderXim.mod.VIT, 3)
    target:addMod(invaderXim.mod.MND, -1)
    target:addMod(invaderXim.mod.FOOD_DEFP, 22)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 65)
    target:addMod(invaderXim.mod.STORETP, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 15)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 150)
    target:delMod(invaderXim.mod.VIT, 3)
    target:delMod(invaderXim.mod.MND, -1)
    target:delMod(invaderXim.mod.FOOD_DEFP, 22)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 65)
    target:delMod(invaderXim.mod.STORETP, 6)
end

return itemObject
