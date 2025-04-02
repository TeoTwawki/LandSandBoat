-----------------------------------
-- ID: 6217
-- Item: slice of anchovy_pizza
-- Food Effect: 30 minutes, all Races
-----------------------------------
-- HP +30
-- DEX +1
-- Accuracy +9% (Cap 15)
-- Attack +10% (Cap 20)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 6217)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 30)
    target:addMod(invaderXim.mod.DEX, 1)
    target:addMod(invaderXim.mod.FOOD_ACCP, 9)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 15)
    target:addMod(invaderXim.mod.FOOD_ATTP, 10)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 20)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 30)
    target:delMod(invaderXim.mod.DEX, 1)
    target:delMod(invaderXim.mod.FOOD_ACCP, 9)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 15)
    target:delMod(invaderXim.mod.FOOD_ATTP, 10)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 20)
end

return itemObject
