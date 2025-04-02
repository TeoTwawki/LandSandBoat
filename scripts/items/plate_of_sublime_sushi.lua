-----------------------------------
-- ID: 6468
-- Item: plate_of_sublime_sushi
-- Food Effect: 30Min, All Races
-----------------------------------
-- HP +40
-- MP +20
-- STR +6
-- DEX +7
-- MND -3
-- CHR +6
-- Accuracy +10% (cap 100)
-- Ranged Accuracy +10% (cap 100)
-- Resist Sleep +1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 6468)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 40)
    target:addMod(invaderXim.mod.FOOD_MP, 20)
    target:addMod(invaderXim.mod.STR, 6)
    target:addMod(invaderXim.mod.DEX, 7)
    target:addMod(invaderXim.mod.MND, -3)
    target:addMod(invaderXim.mod.CHR, 6)
    target:addMod(invaderXim.mod.FOOD_ACCP, 10)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 100)
    target:addMod(invaderXim.mod.FOOD_RACCP, 10)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 100)
    target:addMod(invaderXim.mod.SLEEPRES, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 40)
    target:delMod(invaderXim.mod.FOOD_MP, 20)
    target:delMod(invaderXim.mod.STR, 6)
    target:delMod(invaderXim.mod.DEX, 7)
    target:delMod(invaderXim.mod.MND, -3)
    target:delMod(invaderXim.mod.CHR, 6)
    target:delMod(invaderXim.mod.FOOD_ACCP, 10)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 100)
    target:delMod(invaderXim.mod.FOOD_RACCP, 10)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 100)
    target:delMod(invaderXim.mod.SLEEPRES, 1)
end

return itemObject
