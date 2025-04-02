-----------------------------------
-- ID: 5597
-- Item: simit_+1
-- Food Effect: 60Min, All Races
-----------------------------------
-- Health 18
-- Vitality 4
-- Defense 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5597)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 18)
    target:addMod(invaderXim.mod.VIT, 4)
    target:addMod(invaderXim.mod.DEF, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 18)
    target:delMod(invaderXim.mod.VIT, 4)
    target:delMod(invaderXim.mod.DEF, 2)
end

return itemObject
