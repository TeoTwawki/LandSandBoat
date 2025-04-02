-----------------------------------
-- ID: 5624
-- Item: Dish of Spaghetti Tonno Rosso +1
-- Food Effect: 60 Mins, All Races
-----------------------------------
-- Health % 13
-- Health Cap 185
-- Dexterity 2
-- Vitality 3
-- Store TP +6
-- hMP +1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 7200, 5624)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 13)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 185)
    target:addMod(invaderXim.mod.DEX, 2)
    target:addMod(invaderXim.mod.VIT, 3)
    target:addMod(invaderXim.mod.STORETP, 6)
    target:addMod(invaderXim.mod.HPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 13)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 185)
    target:delMod(invaderXim.mod.DEX, 2)
    target:delMod(invaderXim.mod.VIT, 3)
    target:delMod(invaderXim.mod.STORETP, 6)
    target:delMod(invaderXim.mod.HPHEAL, 1)
end

return itemObject
