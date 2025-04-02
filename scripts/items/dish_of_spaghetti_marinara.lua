-----------------------------------
-- ID: 5719
-- Item: dish_of_spaghetti_marinara
-- Food Effect: 30Min, All Races
-----------------------------------
-- HP % 15 (cap 120)
-- Vitality 2
-- Defense 5
-- Store TP 6
-- hHP +1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5719)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 15)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 120)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.DEF, 5)
    target:addMod(invaderXim.mod.STORETP, 6)
    target:addMod(invaderXim.mod.HPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 15)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 120)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.DEF, 5)
    target:delMod(invaderXim.mod.STORETP, 6)
    target:delMod(invaderXim.mod.HPHEAL, 1)
end

return itemObject
