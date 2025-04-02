-----------------------------------
-- ID: 5150
-- Item: plate_of_tuna_sushi
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health 20
-- Dexterity 3
-- Charisma 5
-- Accuracy % 15 (cap 72)
-- Ranged ACC % 15 (cap 72)
-- Sleep Resist 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5150)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 20)
    target:addMod(invaderXim.mod.DEX, 3)
    target:addMod(invaderXim.mod.CHR, 5)
    target:addMod(invaderXim.mod.FOOD_ACCP, 15)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 72)
    target:addMod(invaderXim.mod.FOOD_RACCP, 15)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 72)
    target:addMod(invaderXim.mod.SLEEPRES, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 20)
    target:delMod(invaderXim.mod.DEX, 3)
    target:delMod(invaderXim.mod.CHR, 5)
    target:delMod(invaderXim.mod.FOOD_ACCP, 15)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 72)
    target:delMod(invaderXim.mod.FOOD_RACCP, 15)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 72)
    target:delMod(invaderXim.mod.SLEEPRES, 1)
end

return itemObject
