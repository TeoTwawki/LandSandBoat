-----------------------------------
-- ID: 5999
-- Item: Bowl of Adoulin Soup +1
-- Food Effect: 240 Min, All Races
-----------------------------------
-- HP % 4 Cap 45
-- Vitality 4
-- Defense % 16 Cap 75
-- HP Healing 7
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5999)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 4)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 45)
    target:addMod(invaderXim.mod.VIT, 4)
    target:addMod(invaderXim.mod.FOOD_DEFP, 16)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 75)
    target:addMod(invaderXim.mod.HPHEAL, 7)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 4)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 45)
    target:delMod(invaderXim.mod.VIT, 4)
    target:delMod(invaderXim.mod.FOOD_DEFP, 16)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 75)
    target:delMod(invaderXim.mod.HPHEAL, 7)
end

return itemObject
