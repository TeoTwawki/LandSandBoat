-----------------------------------
-- ID: 5623
-- Item: Dish of Spaghetti Tonno Rosso
-- Food Effect: 30 Mins, All Races
-----------------------------------
-- Health % 13
-- Health Cap 180
-- Dexterity 1
-- Vitality 2
-- Store TP +6
-- hMP +1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5623)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 13)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 180)
    target:addMod(invaderXim.mod.DEX, 1)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.STORETP, 6)
    target:addMod(invaderXim.mod.HPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 13)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 180)
    target:delMod(invaderXim.mod.DEX, 1)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.STORETP, 6)
    target:delMod(invaderXim.mod.HPHEAL, 1)
end

return itemObject
