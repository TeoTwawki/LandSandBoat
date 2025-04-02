-----------------------------------
-- ID: 5660
-- Item: stick_of_pepperoni
-- Food Effect: 30Min, All Races
-----------------------------------
-- HP % 3 (assuming 3% from testing, no known cap)
-- Strength 3
-- Intelligence -1
-- Attack % 60 (assuming 60%, cap 30)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5660)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 3)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 999)
    target:addMod(invaderXim.mod.STR, 3)
    target:addMod(invaderXim.mod.INT, -1)
    target:addMod(invaderXim.mod.FOOD_ATTP, 60)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 30)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 3)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 999)
    target:delMod(invaderXim.mod.STR, 3)
    target:delMod(invaderXim.mod.INT, -1)
    target:delMod(invaderXim.mod.FOOD_ATTP, 60)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 30)
end

return itemObject
