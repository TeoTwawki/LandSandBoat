-----------------------------------
-- ID: 4517
-- Item: serving_of_yellow_curry
-- Food Effect: 3hours, All Races
-----------------------------------
-- Health Points 20
-- Strength 5
-- Agility 2
-- Intelligence -4
-- HP Recovered While Healing 2
-- MP Recovered While Healing 1
-- Attack 21% (caps @ 75)
-- Ranged Attack 21% (caps @ 75)
-- Resist Sleep +3
-- Resist Stun +4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4517)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 5)
    target:addMod(invaderXim.mod.AGI, 2)
    target:addMod(invaderXim.mod.INT, -4)
    target:addMod(invaderXim.mod.HPHEAL, 2)
    target:addMod(invaderXim.mod.MPHEAL, 1)
    target:addMod(invaderXim.mod.FOOD_ATTP, 21)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 75)
    target:addMod(invaderXim.mod.FOOD_RATTP, 21)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 75)
    target:addMod(invaderXim.mod.SLEEPRES, 3)
    target:addMod(invaderXim.mod.STUNRES, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 5)
    target:delMod(invaderXim.mod.AGI, 2)
    target:delMod(invaderXim.mod.INT, -4)
    target:delMod(invaderXim.mod.HPHEAL, 2)
    target:delMod(invaderXim.mod.MPHEAL, 1)
    target:delMod(invaderXim.mod.FOOD_ATTP, 21)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 75)
    target:delMod(invaderXim.mod.FOOD_RATTP, 21)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 75)
    target:delMod(invaderXim.mod.SLEEPRES, 3)
    target:delMod(invaderXim.mod.STUNRES, 4)
end

return itemObject
