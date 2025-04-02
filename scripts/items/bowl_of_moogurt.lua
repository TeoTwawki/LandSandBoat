-----------------------------------
-- ID: 5935
-- Item: Bowl of Moogurt
-- Food Effect: 30Min, All Races
-----------------------------------
-- HP % 20 Cap 20
-- Vitality 3
-- HP Healing 3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5935)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 20)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 20)
    target:addMod(invaderXim.mod.VIT, 3)
    target:addMod(invaderXim.mod.HPHEAL, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 20)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 20)
    target:delMod(invaderXim.mod.VIT, 3)
    target:delMod(invaderXim.mod.HPHEAL, 3)
end

return itemObject
