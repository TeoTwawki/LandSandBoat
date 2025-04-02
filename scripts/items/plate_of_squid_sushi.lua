-----------------------------------
-- ID: 5148
-- Item: plate_of_squid_sushi
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health 30
-- Dexterity 6
-- Agility 5
-- Mind -1
-- Accuracy % 15
-- Ranged ACC % 15
-- Sleep Resist 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5148)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 30)
    target:addMod(invaderXim.mod.DEX, 6)
    target:addMod(invaderXim.mod.AGI, 5)
    target:addMod(invaderXim.mod.MND, -1)
    target:addMod(invaderXim.mod.FOOD_ACCP, 15)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 72)
    target:addMod(invaderXim.mod.FOOD_RACCP, 15)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 72)
    target:addMod(invaderXim.mod.SLEEPRES, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 30)
    target:delMod(invaderXim.mod.DEX, 6)
    target:delMod(invaderXim.mod.AGI, 5)
    target:delMod(invaderXim.mod.MND, -1)
    target:delMod(invaderXim.mod.FOOD_ACCP, 15)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 72)
    target:delMod(invaderXim.mod.FOOD_RACCP, 15)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 72)
    target:delMod(invaderXim.mod.SLEEPRES, 1)
end

return itemObject
