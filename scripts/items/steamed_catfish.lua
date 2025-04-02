-----------------------------------
-- ID: 4557
-- Item: steamed_catfish
-- Food Effect: 180Min, All Races
-----------------------------------
-- Health 30
-- Magic % 1 (cap 110)
-- Dex 3
-- Intelligence 1
-- Mind -3
-- Earth Res 10
-- Ranged Accuracy +6% (cap 15)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4557)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 30)
    target:addMod(invaderXim.mod.FOOD_MPP, 1)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 110)
    target:addMod(invaderXim.mod.DEX, 3)
    target:addMod(invaderXim.mod.INT, 1)
    target:addMod(invaderXim.mod.MND, -3)
    target:addMod(invaderXim.mod.EARTH_MEVA, 10)
    target:addMod(invaderXim.mod.FOOD_RACCP, 6)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 15)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 30)
    target:delMod(invaderXim.mod.FOOD_MPP, 1)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 110)
    target:delMod(invaderXim.mod.DEX, 3)
    target:delMod(invaderXim.mod.INT, 1)
    target:delMod(invaderXim.mod.MND, -3)
    target:delMod(invaderXim.mod.EARTH_MEVA, 10)
    target:delMod(invaderXim.mod.FOOD_RACCP, 6)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 15)
end

return itemObject
