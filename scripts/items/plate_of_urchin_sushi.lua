-----------------------------------
-- ID: 5151
-- Item: plate_of_urchin_sushi
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health 40
-- Strength 1
-- Vitality 5
-- Accuracy % 15 (cap 72)
-- Ranged ACC % 15 (cap 72)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5151)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 40)
    target:addMod(invaderXim.mod.STR, 1)
    target:addMod(invaderXim.mod.VIT, 5)
    target:addMod(invaderXim.mod.FOOD_ACCP, 15)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 72)
    target:addMod(invaderXim.mod.FOOD_RACCP, 15)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 72)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 40)
    target:delMod(invaderXim.mod.STR, 1)
    target:delMod(invaderXim.mod.VIT, 5)
    target:delMod(invaderXim.mod.FOOD_ACCP, 15)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 72)
    target:delMod(invaderXim.mod.FOOD_RACCP, 15)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 72)
end

return itemObject
