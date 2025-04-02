-----------------------------------
-- ID: 4453
-- Item: Bowl of Eyeball Soup
-- Food Effect: 180Min, All Races
-----------------------------------
-- HP +6% (cap 70)
-- Charisma -10
-- Health Regen While Healing 4
-- Accuracy 12
-- Ranged ACC 12
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4453)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 6)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 70)
    target:addMod(invaderXim.mod.CHR, -10)
    target:addMod(invaderXim.mod.HPHEAL, 4)
    target:addMod(invaderXim.mod.ACC, 12)
    target:addMod(invaderXim.mod.RACC, 12)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 6)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 70)
    target:delMod(invaderXim.mod.CHR, -10)
    target:delMod(invaderXim.mod.HPHEAL, 4)
    target:delMod(invaderXim.mod.ACC, 12)
    target:delMod(invaderXim.mod.RACC, 12)
end

return itemObject
