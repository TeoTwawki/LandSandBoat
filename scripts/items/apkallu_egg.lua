-----------------------------------
-- ID: 5568
-- Item: Apkallu Egg
-- Food Effect: 5Min, All Races
-----------------------------------
-- Health 6
-- Magic 6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5568)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 6)
    target:addMod(invaderXim.mod.FOOD_MP, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 6)
    target:delMod(invaderXim.mod.FOOD_MP, 6)
end

return itemObject
