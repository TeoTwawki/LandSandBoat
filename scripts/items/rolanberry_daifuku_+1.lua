-----------------------------------
-- ID: 6340
-- Item: rolanberry_daifuku_+1
-- Food Effect: 60 Min, All Races
-----------------------------------
-- HP +30
-- DEX +3
-- VIT +4
-- Accuracy +11% (cap 85)
-- Ranged Accuracy +11% (cap 85)
-- Magic Accuracy +55
-- Pet:
-- HP +30
-- DEX +3
-- VIT +4
-- Accuracy +11% (cap 110)
-- Ranged Accuracy +11% (cap 110)
-- Magic Accuracy +80
-- https://www.bg-wiki.com/bg/Rolan._Daifuku_%2B1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 6340)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 30)
    target:addMod(invaderXim.mod.DEX, 3)
    target:addMod(invaderXim.mod.VIT, 4)
    target:addMod(invaderXim.mod.FOOD_ACCP, 11)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 85)
    target:addMod(invaderXim.mod.FOOD_RACCP, 11)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 85)
    target:addMod(invaderXim.mod.MACC, 55)
    target:addPetMod(invaderXim.mod.FOOD_HP, 30)
    target:addPetMod(invaderXim.mod.DEX, 3)
    target:addPetMod(invaderXim.mod.VIT, 4)
    target:addPetMod(invaderXim.mod.FOOD_ACCP, 11)
    target:addPetMod(invaderXim.mod.FOOD_ACC_CAP, 110)
    target:addPetMod(invaderXim.mod.FOOD_RACCP, 11)
    target:addPetMod(invaderXim.mod.FOOD_RACC_CAP, 110)
    target:addPetMod(invaderXim.mod.MACC, 80)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 30)
    target:delMod(invaderXim.mod.DEX, 3)
    target:delMod(invaderXim.mod.VIT, 4)
    target:delMod(invaderXim.mod.FOOD_ACCP, 11)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 85)
    target:delMod(invaderXim.mod.FOOD_RACCP, 11)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 85)
    target:delMod(invaderXim.mod.MACC, 55)
    target:delPetMod(invaderXim.mod.FOOD_HP, 30)
    target:delPetMod(invaderXim.mod.DEX, 3)
    target:delPetMod(invaderXim.mod.VIT, 4)
    target:delPetMod(invaderXim.mod.FOOD_ACCP, 11)
    target:delPetMod(invaderXim.mod.FOOD_ACC_CAP, 110)
    target:delPetMod(invaderXim.mod.FOOD_RACCP, 11)
    target:delPetMod(invaderXim.mod.FOOD_RACC_CAP, 110)
    target:delPetMod(invaderXim.mod.MACC, 80)
end

return itemObject
