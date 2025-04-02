-----------------------------------
-- ID: 5160
-- Item: plate_of_urchin_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------
-- Health 40
-- Strength 1
-- Vitality 6
-- Accuracy % 16 (cap 76)
-- Ranged ACC % 16 (cap 76)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5160)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 40)
    target:addMod(invaderXim.mod.STR, 1)
    target:addMod(invaderXim.mod.VIT, 6)
    target:addMod(invaderXim.mod.FOOD_ACCP, 16)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 76)
    target:addMod(invaderXim.mod.FOOD_RACCP, 16)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 76)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 40)
    target:delMod(invaderXim.mod.STR, 1)
    target:delMod(invaderXim.mod.VIT, 6)
    target:delMod(invaderXim.mod.FOOD_ACCP, 16)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 76)
    target:delMod(invaderXim.mod.FOOD_RACCP, 16)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 76)
end

return itemObject
