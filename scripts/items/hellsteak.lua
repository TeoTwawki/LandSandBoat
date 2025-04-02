-----------------------------------
-- ID: 5609
-- Item: hellsteak
-- Food Effect: 180Min, All Races
-----------------------------------
-- Health 20
-- Strength 6
-- Intelligence -2
-- Health Regen While Healing 2
-- hMP +1
-- Attack % 18 (cap 145)
-- Ranged ATT % 18 (cap 145)
-- Dragon Killer 5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5609)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 20)
    target:addMod(invaderXim.mod.STR, 6)
    target:addMod(invaderXim.mod.INT, -2)
    target:addMod(invaderXim.mod.HPHEAL, 2)
    target:addMod(invaderXim.mod.MPHEAL, 1)
    target:addMod(invaderXim.mod.FOOD_ATTP, 18)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 145)
    target:addMod(invaderXim.mod.FOOD_RATTP, 18)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 145)
    target:addMod(invaderXim.mod.DRAGON_KILLER, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 20)
    target:delMod(invaderXim.mod.STR, 6)
    target:delMod(invaderXim.mod.INT, -2)
    target:delMod(invaderXim.mod.HPHEAL, 2)
    target:delMod(invaderXim.mod.MPHEAL, 1)
    target:delMod(invaderXim.mod.FOOD_ATTP, 18)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 145)
    target:delMod(invaderXim.mod.FOOD_RATTP, 18)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 145)
    target:delMod(invaderXim.mod.DRAGON_KILLER, 5)
end

return itemObject
