-----------------------------------
-- ID: 4340
-- Item: bowl_of_optical_soup
-- Food Effect: 4Hrs, All Races
-----------------------------------
-- HP % 6 (cap 75)
-- Charisma -15
-- HP Recovered While Healing 5
-- Accuracy 15
-- Ranged Accuracy 15
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 4340)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 6)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 75)
    target:addMod(invaderXim.mod.CHR, -15)
    target:addMod(invaderXim.mod.HPHEAL, 5)
    target:addMod(invaderXim.mod.ACC, 15)
    target:addMod(invaderXim.mod.RACC, 15)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 6)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 75)
    target:delMod(invaderXim.mod.CHR, -15)
    target:delMod(invaderXim.mod.HPHEAL, 5)
    target:delMod(invaderXim.mod.ACC, 15)
    target:delMod(invaderXim.mod.RACC, 15)
end

return itemObject
