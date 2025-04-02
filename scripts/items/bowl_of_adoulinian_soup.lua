-----------------------------------
-- ID: 5998
-- Item: Bowl of Adoulin Soup
-- Food Effect: 180 Min, All Races
-----------------------------------
-- HP % 3 Cap 40
-- Vitality 3
-- Defense % 15 Cap 70
-- HP Healing 6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5998)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 3)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 40)
    target:addMod(invaderXim.mod.VIT, 3)
    target:addMod(invaderXim.mod.FOOD_DEFP, 15)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 70)
    target:addMod(invaderXim.mod.HPHEAL, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 3)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 40)
    target:delMod(invaderXim.mod.VIT, 3)
    target:delMod(invaderXim.mod.FOOD_DEFP, 15)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 70)
    target:delMod(invaderXim.mod.HPHEAL, 6)
end

return itemObject
