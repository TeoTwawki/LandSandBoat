-----------------------------------
-- ID: 4585
-- Item: Broiled Pipira
-- Food Effect: 60Min, All Races
-----------------------------------
-- Dexterity 4
-- Mind -1
-- Attack % 14 (cap 80)
-- Ranged ATT % 14 (cap 80)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 4585)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 4)
    target:addMod(invaderXim.mod.MND, -1)
    target:addMod(invaderXim.mod.FOOD_ATTP, 14)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 80)
    target:addMod(invaderXim.mod.FOOD_RATTP, 14)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 80)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 4)
    target:delMod(invaderXim.mod.MND, -1)
    target:delMod(invaderXim.mod.FOOD_ATTP, 14)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 80)
    target:delMod(invaderXim.mod.FOOD_RATTP, 14)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 80)
end

return itemObject
