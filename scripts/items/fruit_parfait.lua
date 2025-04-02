-----------------------------------
-- ID: 6063
-- Item: fruit_parfait
-- Food Effect: 180 Min, All Races
-----------------------------------
-- MP+5% (Upper limit 50)
-- INT+3
-- MND+2
-- CHR+1
-- STR-3
-- MACC+3
-- MAB+6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 6063)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 5)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 50)
    target:addMod(invaderXim.mod.INT, 3)
    target:addMod(invaderXim.mod.MND, 2)
    target:addMod(invaderXim.mod.CHR, 1)
    target:addMod(invaderXim.mod.STR, -3)
    target:addMod(invaderXim.mod.MACC, 3)
    target:addMod(invaderXim.mod.MATT, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 5)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 50)
    target:delMod(invaderXim.mod.INT, 3)
    target:delMod(invaderXim.mod.MND, 2)
    target:delMod(invaderXim.mod.CHR, 1)
    target:delMod(invaderXim.mod.STR, -3)
    target:delMod(invaderXim.mod.MACC, 3)
    target:delMod(invaderXim.mod.MATT, 6)
end

return itemObject
