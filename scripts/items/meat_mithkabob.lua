-----------------------------------
-- ID: 4381
-- Item: meat_mithkabob
-- Food Effect: 30Min, All Races
-----------------------------------
-- Strength 5
-- Agility 1
-- Intelligence -2
-- Attack % 22
-- Attack Cap 60
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4381)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 5)
    target:addMod(invaderXim.mod.AGI, 1)
    target:addMod(invaderXim.mod.INT, -2)
    target:addMod(invaderXim.mod.FOOD_ATTP, 22)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 60)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 5)
    target:delMod(invaderXim.mod.AGI, 1)
    target:delMod(invaderXim.mod.INT, -2)
    target:delMod(invaderXim.mod.FOOD_ATTP, 22)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 60)
end

return itemObject
