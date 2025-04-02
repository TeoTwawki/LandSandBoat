-----------------------------------
-- ID: 4549
-- Item: Bowl of Dragon Soup
-- Food Effect: 180Min, All Races
-----------------------------------
-- Health 20
-- Strength 7
-- Agility 2
-- Vitality 2
-- Intelligence -3
-- Health Regen While Healing 8
-- Attack % 22
-- Attack Cap 150
-- Ranged ATT % 22
-- Ranged ATT Cap 150
-- Demon Killer 5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4549)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 20)
    target:addMod(invaderXim.mod.STR, 7)
    target:addMod(invaderXim.mod.AGI, 2)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.INT, -3)
    target:addMod(invaderXim.mod.HPHEAL, 8)
    target:addMod(invaderXim.mod.FOOD_ATTP, 22)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 150)
    target:addMod(invaderXim.mod.FOOD_RATTP, 22)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 150)
    target:addMod(invaderXim.mod.DEMON_KILLER, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 20)
    target:delMod(invaderXim.mod.STR, 7)
    target:delMod(invaderXim.mod.AGI, 2)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.INT, -3)
    target:delMod(invaderXim.mod.HPHEAL, 8)
    target:delMod(invaderXim.mod.FOOD_ATTP, 22)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 150)
    target:delMod(invaderXim.mod.FOOD_RATTP, 22)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 150)
    target:delMod(invaderXim.mod.DEMON_KILLER, 5)
end

return itemObject
