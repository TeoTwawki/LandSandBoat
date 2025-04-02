-----------------------------------
-- ID: 5213
-- Item: dish_of_spaghetti_melanzane
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health % 25
-- Health Cap 100
-- Vitality 2
-- Store TP 6
-- Resist sleep 10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5213)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 25)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 100)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.STORETP, 6)
    target:addMod(invaderXim.mod.SLEEPRES, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 25)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 100)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.STORETP, 6)
    target:delMod(invaderXim.mod.SLEEPRES, 10)
end

return itemObject
