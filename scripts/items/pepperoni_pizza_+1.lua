-----------------------------------
-- ID: 5698
-- Item: pepperoni_pizza_+1
-- Food Effect: 4 hours, all Races
-----------------------------------
-- HP +35
-- Strength 2
-- Accuracy 9% (caps @ 11)
-- Attack 10% (caps @ 16)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5698)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 35)
    target:addMod(invaderXim.mod.STR, 2)
    target:addMod(invaderXim.mod.FOOD_ATTP, 10)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 16)
    target:addMod(invaderXim.mod.FOOD_ACCP, 9)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 11)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 35)
    target:delMod(invaderXim.mod.STR, 2)
    target:delMod(invaderXim.mod.FOOD_ATTP, 10)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 16)
    target:delMod(invaderXim.mod.FOOD_ACCP, 9)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 11)
end

return itemObject
