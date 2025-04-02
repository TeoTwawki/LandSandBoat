-----------------------------------
-- ID: 5697
-- Item: pepperoni_pizza
-- Food Effect: 3 hours, all Races
-----------------------------------
-- HP +30
-- Strength 1
-- Accuracy 9% (caps @ 10)
-- Attack 10% (caps @ 15)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5697)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 30)
    target:addMod(invaderXim.mod.STR, 1)
    target:addMod(invaderXim.mod.FOOD_ATTP, 10)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 15)
    target:addMod(invaderXim.mod.FOOD_ACCP, 9)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 30)
    target:delMod(invaderXim.mod.STR, 1)
    target:delMod(invaderXim.mod.FOOD_ATTP, 10)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 15)
    target:delMod(invaderXim.mod.FOOD_ACCP, 9)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 10)
end

return itemObject
