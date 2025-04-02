-----------------------------------
-- ID: 4326
-- Item: serving_of_frog_flambe
-- Food Effect: 60Min, All Races
-----------------------------------
-- Dexterity 3
-- Agility 2
-- Mind -2
-- Attack +14% (cap 80)
-- Ranged Attack +14% (cap 80)
-- Evasion 5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 4326)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 3)
    target:addMod(invaderXim.mod.AGI, 2)
    target:addMod(invaderXim.mod.MND, -2)
    target:addMod(invaderXim.mod.FOOD_ATTP, 14)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 80)
    target:addMod(invaderXim.mod.EVA, 5)
    target:addMod(invaderXim.mod.FOOD_RATTP, 14)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 80)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 3)
    target:delMod(invaderXim.mod.AGI, 2)
    target:delMod(invaderXim.mod.MND, -2)
    target:delMod(invaderXim.mod.FOOD_ATTP, 14)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 80)
    target:delMod(invaderXim.mod.EVA, 5)
    target:delMod(invaderXim.mod.FOOD_RATTP, 14)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 80)
end

return itemObject
