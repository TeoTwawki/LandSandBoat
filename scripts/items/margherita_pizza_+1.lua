-----------------------------------
-- ID: 5696
-- Item: margherita_pizza_+1
-- Food Effect: 4 hours, all Races
-----------------------------------
-- HP +35
-- Accuracy +10% (cap 9)
-- Attack +10% (cap 11)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5696)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 35)
    target:addMod(invaderXim.mod.FOOD_ACCP, 10)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 9)
    target:addMod(invaderXim.mod.FOOD_ATTP, 10)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 11)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 35)
    target:delMod(invaderXim.mod.FOOD_ACCP, 10)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 9)
    target:delMod(invaderXim.mod.FOOD_ATTP, 10)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 11)
end

return itemObject
