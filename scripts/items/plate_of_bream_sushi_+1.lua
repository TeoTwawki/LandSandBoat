-----------------------------------
-- ID: 5177
-- Item: plate_of_bream_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------
-- Dexterity 6
-- Vitality 5
-- Accuracy % 17 (cap 80)
-- Ranged ACC % 17 (cap 80)
-- Sleep Resist 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5177)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 6)
    target:addMod(invaderXim.mod.VIT, 5)
    target:addMod(invaderXim.mod.FOOD_ACCP, 17)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 80)
    target:addMod(invaderXim.mod.FOOD_RACCP, 17)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 80)
    target:addMod(invaderXim.mod.SLEEPRES, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 6)
    target:delMod(invaderXim.mod.VIT, 5)
    target:delMod(invaderXim.mod.FOOD_ACCP, 17)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 80)
    target:delMod(invaderXim.mod.FOOD_RACCP, 17)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 80)
    target:delMod(invaderXim.mod.SLEEPRES, 2)
end

return itemObject
