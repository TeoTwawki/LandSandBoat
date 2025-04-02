-----------------------------------
-- ID: 5179
-- Item: plate_of_dorado_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------
-- Dexterity 5
-- Accuracy % 16
-- Accuracy Cap 76
-- Ranged ACC % 16
-- Ranged ACC Cap 76
-- Sleep Resist 2
-- Enmity 5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5179)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.ENMITY, 5)
    target:addMod(invaderXim.mod.DEX, 5)
    target:addMod(invaderXim.mod.FOOD_ACCP, 16)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 76)
    target:addMod(invaderXim.mod.FOOD_RACCP, 16)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 76)
    target:addMod(invaderXim.mod.SLEEPRES, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.ENMITY, 5)
    target:delMod(invaderXim.mod.DEX, 5)
    target:delMod(invaderXim.mod.FOOD_ACCP, 16)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 76)
    target:delMod(invaderXim.mod.FOOD_RACCP, 16)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 76)
    target:delMod(invaderXim.mod.SLEEPRES, 2)
end

return itemObject
