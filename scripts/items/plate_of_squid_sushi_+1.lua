-----------------------------------
-- ID: 5162
-- Item: plate_of_squid_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------
-- Health 30
-- Dexterity 6
-- Agility 5
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
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5162)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 30)
    target:addMod(invaderXim.mod.DEX, 6)
    target:addMod(invaderXim.mod.AGI, 5)
    target:addMod(invaderXim.mod.FOOD_ACCP, 16)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 76)
    target:addMod(invaderXim.mod.FOOD_RACCP, 16)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 76)
    target:addMod(invaderXim.mod.SLEEPRES, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 30)
    target:delMod(invaderXim.mod.DEX, 6)
    target:delMod(invaderXim.mod.AGI, 5)
    target:delMod(invaderXim.mod.FOOD_ACCP, 16)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 76)
    target:delMod(invaderXim.mod.FOOD_RACCP, 16)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 76)
    target:delMod(invaderXim.mod.SLEEPRES, 2)
end

return itemObject
