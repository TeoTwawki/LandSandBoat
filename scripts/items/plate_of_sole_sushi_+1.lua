-----------------------------------
-- ID: 5163
-- Item: plate_of_sole_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------
-- Health 20
-- Strength 5
-- Dexterity 6
-- Accuracy % 16
-- Ranged ACC % 16
-- Sleep Resist 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5163)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 20)
    target:addMod(invaderXim.mod.STR, 5)
    target:addMod(invaderXim.mod.DEX, 6)
    target:addMod(invaderXim.mod.FOOD_ACCP, 16)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 76)
    target:addMod(invaderXim.mod.FOOD_RACCP, 16)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 76)
    target:addMod(invaderXim.mod.SLEEPRES, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 20)
    target:delMod(invaderXim.mod.STR, 5)
    target:delMod(invaderXim.mod.DEX, 6)
    target:delMod(invaderXim.mod.FOOD_ACCP, 16)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 76)
    target:delMod(invaderXim.mod.FOOD_RACCP, 16)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 76)
    target:delMod(invaderXim.mod.SLEEPRES, 2)
end

return itemObject
