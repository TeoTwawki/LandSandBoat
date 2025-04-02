-----------------------------------
-- ID: 4350
-- Item: dragon_steak
-- Food Effect: 180Min, All Races
-----------------------------------
-- Health 25
-- Strength 7
-- Intelligence -3
-- Health Regen While Healing 2
-- MP recovered while healing +2
-- Attack % 20
-- Attack Cap 150
-- Ranged ATT % 20
-- Ranged ATT Cap 150
-- Demon Killer 5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4350)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 25)
    target:addMod(invaderXim.mod.STR, 7)
    target:addMod(invaderXim.mod.INT, -3)
    target:addMod(invaderXim.mod.HPHEAL, 2)
    target:addMod(invaderXim.mod.MPHEAL, 2)
    target:addMod(invaderXim.mod.FOOD_ATTP, 20)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 150)
    target:addMod(invaderXim.mod.FOOD_RATTP, 20)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 150)
    target:addMod(invaderXim.mod.DEMON_KILLER, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 25)
    target:delMod(invaderXim.mod.STR, 7)
    target:delMod(invaderXim.mod.INT, -3)
    target:delMod(invaderXim.mod.HPHEAL, 2)
    target:delMod(invaderXim.mod.MPHEAL, 2)
    target:delMod(invaderXim.mod.FOOD_ATTP, 20)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 150)
    target:delMod(invaderXim.mod.FOOD_RATTP, 20)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 150)
    target:delMod(invaderXim.mod.DEMON_KILLER, 5)
end

return itemObject
