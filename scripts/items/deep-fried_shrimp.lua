-----------------------------------
-- ID: 6276
-- Item: deep-fried_shrimp
-- Food Effect: 30Min, All Races
-----------------------------------
-- VIT +3
-- Fire resistance +20
-- Accuracy +20% (cap 70)
-- Ranged Accuracy +20% (cap 70)
-- Subtle Blow +8
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 6276)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.VIT, 3)
    target:addMod(invaderXim.mod.FIRE_MEVA, 20)
    target:addMod(invaderXim.mod.FOOD_ACCP, 20)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 70)
    target:addMod(invaderXim.mod.FOOD_RACCP, 20)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 70)
    target:addMod(invaderXim.mod.SUBTLE_BLOW, 8)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.VIT, 3)
    target:delMod(invaderXim.mod.FIRE_MEVA, 20)
    target:delMod(invaderXim.mod.FOOD_ACCP, 20)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 70)
    target:delMod(invaderXim.mod.FOOD_RACCP, 20)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 70)
    target:delMod(invaderXim.mod.SUBTLE_BLOW, 8)
end

return itemObject
