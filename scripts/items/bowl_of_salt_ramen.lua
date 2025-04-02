-----------------------------------
-- ID: 6462
-- Item: bowl_of_salt_ramen
-- Food Effect: 30Min, All Races
-----------------------------------
-- DEX +5
-- VIT +5
-- AGI +5
-- Accuracy +5% (cap 90)
-- Ranged Accuracy +5% (cap 90)
-- Evasion +5% (cap 90)
-- Resist Slow +10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 6462)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 5)
    target:addMod(invaderXim.mod.VIT, 5)
    target:addMod(invaderXim.mod.AGI, 5)
    target:addMod(invaderXim.mod.FOOD_ACCP, 5)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 90)
    target:addMod(invaderXim.mod.FOOD_RACCP, 5)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 90)
    -- target:addMod(invaderXim.mod.FOOD_EVAP, 5)
    -- target:addMod(invaderXim.mod.FOOD_EVA_CAP, 90)
    target:addMod(invaderXim.mod.SLOWRES, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 5)
    target:delMod(invaderXim.mod.VIT, 5)
    target:delMod(invaderXim.mod.AGI, 5)
    target:delMod(invaderXim.mod.FOOD_ACCP, 5)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 90)
    target:delMod(invaderXim.mod.FOOD_RACCP, 5)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 90)
    -- target:delMod(invaderXim.mod.FOOD_EVAP, 5)
    -- target:delMod(invaderXim.mod.FOOD_EVA_CAP, 90)
    target:delMod(invaderXim.mod.SLOWRES, 10)
end

return itemObject
