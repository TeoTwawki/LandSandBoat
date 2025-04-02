-----------------------------------
-- ID: 6463
-- Item: bowl_of_salt_ramen_+1
-- Food Effect: 60Min, All Races
-----------------------------------
-- DEX +6
-- VIT +6
-- AGI +6
-- Accuracy +6% (cap 95)
-- Ranged Accuracy +6% (cap 95)
-- Evasion +6% (cap 95)
-- Resist Slow +15
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 6463)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 6)
    target:addMod(invaderXim.mod.VIT, 6)
    target:addMod(invaderXim.mod.AGI, 6)
    target:addMod(invaderXim.mod.FOOD_ACCP, 6)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 95)
    target:addMod(invaderXim.mod.FOOD_RACCP, 6)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 95)
    -- target:addMod(invaderXim.mod.FOOD_EVAP, 6)
    -- target:addMod(invaderXim.mod.FOOD_EVA_CAP, 95)
    target:addMod(invaderXim.mod.SLOWRES, 15)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 6)
    target:delMod(invaderXim.mod.VIT, 6)
    target:delMod(invaderXim.mod.AGI, 6)
    target:delMod(invaderXim.mod.FOOD_ACCP, 6)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 95)
    target:delMod(invaderXim.mod.FOOD_RACCP, 6)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 95)
    -- target:delMod(invaderXim.mod.FOOD_EVAP, 6)
    -- target:delMod(invaderXim.mod.FOOD_EVA_CAP, 95)
    target:delMod(invaderXim.mod.SLOWRES, 15)
end

return itemObject
