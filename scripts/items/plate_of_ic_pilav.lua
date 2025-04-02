-----------------------------------
-- ID: 5584
-- Item: plate_of_ic_pilav
-- Food Effect: 180Min, All Races
-----------------------------------
-- Health % 14
-- Health Cap 65
-- Strength 4
-- Vitality -1
-- Intelligence -1
-- Health Regen While Healing 1
-- Attack % 22
-- Attack Cap 65
-- Ranged ATT % 22
-- Ranged ATT Cap 65
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5584)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 14)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 65)
    target:addMod(invaderXim.mod.STR, 4)
    target:addMod(invaderXim.mod.VIT, -1)
    target:addMod(invaderXim.mod.INT, -1)
    target:addMod(invaderXim.mod.HPHEAL, 1)
    target:addMod(invaderXim.mod.FOOD_ATTP, 22)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 65)
    target:addMod(invaderXim.mod.FOOD_RATTP, 22)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 65)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 14)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 65)
    target:delMod(invaderXim.mod.STR, 4)
    target:delMod(invaderXim.mod.VIT, -1)
    target:delMod(invaderXim.mod.INT, -1)
    target:delMod(invaderXim.mod.HPHEAL, 1)
    target:delMod(invaderXim.mod.FOOD_ATTP, 22)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 65)
    target:delMod(invaderXim.mod.FOOD_RATTP, 22)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 65)
end

return itemObject
