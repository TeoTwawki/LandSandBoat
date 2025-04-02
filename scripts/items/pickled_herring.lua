-----------------------------------
-- ID: 4490
-- Item: Pickled Herring
-- Food Effect: 30Min, All Races
-----------------------------------
-- Dexterity 3
-- Mind -3
-- Attack % 12 (cap 70)
-- Ranged ATT % 12 (cap 70)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4490)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 3)
    target:addMod(invaderXim.mod.MND, -3)
    target:addMod(invaderXim.mod.FOOD_ATTP, 12)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 70)
    target:addMod(invaderXim.mod.FOOD_RATTP, 12)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 70)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 3)
    target:delMod(invaderXim.mod.MND, -3)
    target:delMod(invaderXim.mod.FOOD_ATTP, 12)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 70)
    target:delMod(invaderXim.mod.FOOD_RATTP, 12)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 70)
end

return itemObject
