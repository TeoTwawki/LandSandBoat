-----------------------------------
-- ID: 6342
-- Item: bean_daifuku_+1
-- Food Effect: 60 Min, All Races
-----------------------------------
-- HP +30
-- VIT +7
-- Accuracy +11% (cap 85)
-- Ranged Accuracy +11% (cap 85)
-- Pet:
-- HP +30
-- VIT +7
-- Accuracy +11% (cap 110)
-- Ranged Accuracy +11% (cap 110)
-- Defense +11% (cap 105)
-- Haste +4%
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 6342)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 30)
    target:addMod(invaderXim.mod.VIT, 7)
    target:addMod(invaderXim.mod.FOOD_ACCP, 11)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 85)
    target:addMod(invaderXim.mod.FOOD_RACCP, 11)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 85)
    target:addPetMod(invaderXim.mod.FOOD_HP, 30)
    target:addPetMod(invaderXim.mod.VIT, 7)
    target:addPetMod(invaderXim.mod.FOOD_ACCP, 11)
    target:addPetMod(invaderXim.mod.FOOD_ACC_CAP, 110)
    target:addPetMod(invaderXim.mod.FOOD_RACCP, 11)
    target:addPetMod(invaderXim.mod.FOOD_RACC_CAP, 110)
    target:addPetMod(invaderXim.mod.FOOD_DEFP, 11)
    target:addPetMod(invaderXim.mod.FOOD_DEF_CAP, 105)
    target:addPetMod(invaderXim.mod.HASTE_GEAR, 400)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 30)
    target:delMod(invaderXim.mod.VIT, 7)
    target:delMod(invaderXim.mod.FOOD_ACCP, 11)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 85)
    target:delMod(invaderXim.mod.FOOD_RACCP, 11)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 85)
    target:delPetMod(invaderXim.mod.FOOD_HP, 30)
    target:delPetMod(invaderXim.mod.VIT, 7)
    target:delPetMod(invaderXim.mod.FOOD_ACCP, 11)
    target:delPetMod(invaderXim.mod.FOOD_ACC_CAP, 110)
    target:delPetMod(invaderXim.mod.FOOD_RACCP, 11)
    target:delPetMod(invaderXim.mod.FOOD_RACC_CAP, 110)
    target:delPetMod(invaderXim.mod.FOOD_DEFP, 11)
    target:delPetMod(invaderXim.mod.FOOD_DEF_CAP, 105)
    target:delPetMod(invaderXim.mod.HASTE_GEAR, 400)
end

return itemObject
