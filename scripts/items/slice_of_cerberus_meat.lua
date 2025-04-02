-----------------------------------
-- ID: 5565
-- Item: slice_of_cerberus_meat
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health 10
-- Magic -10
-- Strength 6
-- Intelligence -6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.RAW_MEAT)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5565)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 10)
    target:addMod(invaderXim.mod.FOOD_MP, -10)
    target:addMod(invaderXim.mod.STR, 6)
    target:addMod(invaderXim.mod.INT, -6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 10)
    target:delMod(invaderXim.mod.FOOD_MP, -10)
    target:delMod(invaderXim.mod.STR, 6)
    target:delMod(invaderXim.mod.INT, -6)
end

return itemObject
