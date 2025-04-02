-----------------------------------
-- ID: 6469
-- Item: plate_of_sublime_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------
-- HP +45
-- MP +25
-- STR +7
-- DEX +8
-- MND -4
-- CHR +7
-- Accuracy +11% (cap 105)
-- Ranged Accuracy +11% (cap 105)
-- Resist Sleep +2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 6469)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 45)
    target:addMod(invaderXim.mod.FOOD_MP, 25)
    target:addMod(invaderXim.mod.STR, 7)
    target:addMod(invaderXim.mod.DEX, 8)
    target:addMod(invaderXim.mod.MND, -4)
    target:addMod(invaderXim.mod.CHR, 7)
    target:addMod(invaderXim.mod.FOOD_ACCP, 11)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 105)
    target:addMod(invaderXim.mod.FOOD_RACCP, 11)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 105)
    target:addMod(invaderXim.mod.SLEEPRES, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 45)
    target:delMod(invaderXim.mod.FOOD_MP, 25)
    target:delMod(invaderXim.mod.STR, 7)
    target:delMod(invaderXim.mod.DEX, 8)
    target:delMod(invaderXim.mod.MND, -4)
    target:delMod(invaderXim.mod.CHR, 7)
    target:delMod(invaderXim.mod.FOOD_ACCP, 11)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 105)
    target:delMod(invaderXim.mod.FOOD_RACCP, 11)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 105)
    target:delMod(invaderXim.mod.SLEEPRES, 2)
end

return itemObject
