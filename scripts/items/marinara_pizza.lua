-----------------------------------
-- ID: 5743
-- Item: marinara_pizza
-- Food Effect: 3 hours, all Races
-----------------------------------
-- HP +20
-- Attack +20% (cap 50 @ 250 base attack)
-- Accuracy +10% (54)
-- Undead Killer
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5743)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 20)
    target:addMod(invaderXim.mod.FOOD_ATTP, 20)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 50)
    target:addMod(invaderXim.mod.FOOD_ACCP, 10)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 54)
    target:addMod(invaderXim.mod.UNDEAD_KILLER, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 20)
    target:delMod(invaderXim.mod.FOOD_ATTP, 20)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 50)
    target:delMod(invaderXim.mod.FOOD_ACCP, 10)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 54)
    target:delMod(invaderXim.mod.UNDEAD_KILLER, 5)
end

return itemObject
