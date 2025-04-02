-----------------------------------
-- ID: 4292
-- Item: loaf_of_pain_de_neige
-- Food Effect: 60Min, All Races
-----------------------------------
-- Health 18
-- Vitality 4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 4292)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 18)
    target:addMod(invaderXim.mod.VIT, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 18)
    target:delMod(invaderXim.mod.VIT, 4)
end

return itemObject
