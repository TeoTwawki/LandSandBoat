-----------------------------------
-- ID: 5166
-- Item: coeurl_sub
-- Food Effect: 30Min, All Races
-----------------------------------
-- Magic 10
-- Strength 5
-- Agility 1
-- Intelligence -2
-- Health Regen While Healing 1
-- Attack % 20
-- Attack Cap 75
-- Ranged ATT % 20
-- Ranged ATT Cap 75
-- Resist Stun +4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5166)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 10)
    target:addMod(invaderXim.mod.STR, 5)
    target:addMod(invaderXim.mod.AGI, 1)
    target:addMod(invaderXim.mod.INT, -2)
    target:addMod(invaderXim.mod.HPHEAL, 1)
    target:addMod(invaderXim.mod.FOOD_ATTP, 20)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 75)
    target:addMod(invaderXim.mod.FOOD_RATTP, 20)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 75)
    target:addMod(invaderXim.mod.STUNRES, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 10)
    target:delMod(invaderXim.mod.STR, 5)
    target:delMod(invaderXim.mod.AGI, 1)
    target:delMod(invaderXim.mod.INT, -2)
    target:delMod(invaderXim.mod.HPHEAL, 1)
    target:delMod(invaderXim.mod.FOOD_ATTP, 20)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 75)
    target:delMod(invaderXim.mod.FOOD_RATTP, 20)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 75)
    target:delMod(invaderXim.mod.STUNRES, 4)
end

return itemObject
