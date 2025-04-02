-----------------------------------
-- ID: 6064
-- Item: queens_crown
-- Food Effect: 240 Min, All Races
-----------------------------------
-- MP+6% (Upper limit 55)
-- INT+4
-- MND+3
-- CHR+2
-- STR-2
-- MACC+4
-- MAB+7
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 6064)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 6)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 55)
    target:addMod(invaderXim.mod.INT, 4)
    target:addMod(invaderXim.mod.MND, 3)
    target:addMod(invaderXim.mod.CHR, 2)
    target:addMod(invaderXim.mod.STR, -2)
    target:addMod(invaderXim.mod.MACC, 4)
    target:addMod(invaderXim.mod.MATT, 7)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 6)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 55)
    target:delMod(invaderXim.mod.INT, 4)
    target:delMod(invaderXim.mod.MND, 3)
    target:delMod(invaderXim.mod.CHR, 2)
    target:delMod(invaderXim.mod.STR, -2)
    target:delMod(invaderXim.mod.MACC, 4)
    target:delMod(invaderXim.mod.MATT, 7)
end

return itemObject
