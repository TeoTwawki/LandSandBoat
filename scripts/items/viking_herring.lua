-----------------------------------
-- ID: 5183
-- Item: viking_herring
-- Food Effect: 60Min, All Races
-----------------------------------
-- Dexterity 4
-- Mind -3
-- Attack % 12 (cap 75)
-- Ranged ATT % 12 (cap 75)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5183)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 4)
    target:addMod(invaderXim.mod.MND, -3)
    target:addMod(invaderXim.mod.FOOD_ATTP, 12)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 75)
    target:addMod(invaderXim.mod.FOOD_RATTP, 12)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 75)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 4)
    target:delMod(invaderXim.mod.MND, -3)
    target:delMod(invaderXim.mod.FOOD_ATTP, 12)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 75)
    target:delMod(invaderXim.mod.FOOD_RATTP, 12)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 75)
end

return itemObject
