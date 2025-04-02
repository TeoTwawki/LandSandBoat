-----------------------------------
-- ID: 4602
-- Item: warm_egg
-- Food Effect: 5Min, All Races
-----------------------------------
-- Health 18
-- Magic 18
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 4602)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 18)
    target:addMod(invaderXim.mod.FOOD_MP, 18)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 18)
    target:delMod(invaderXim.mod.FOOD_MP, 18)
end

return itemObject
