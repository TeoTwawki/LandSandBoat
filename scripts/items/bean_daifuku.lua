-----------------------------------
-- ID: 6341
-- Item: bean_daifuku
-- Food Effect: 30 Min, All Races
-----------------------------------
-- HP +20
-- VIT +5
-- Accuracy +10% (cap 80)
-- Ranged Accuracy +10% (cap 80)
-- Pet:
-- HP +20
-- VIT +5
-- Accuracy +10% (cap 105)
-- Ranged Accuracy +10% (cap 105)
-- Defense +10% (cap 100)
-- Haste +3%
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 6341)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 20)
    target:addMod(invaderXim.mod.VIT, 5)
    target:addMod(invaderXim.mod.FOOD_ACCP, 10)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 80)
    target:addMod(invaderXim.mod.FOOD_RACCP, 10)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 80)
    target:addPetMod(invaderXim.mod.FOOD_HP, 20)
    target:addPetMod(invaderXim.mod.VIT, 5)
    target:addPetMod(invaderXim.mod.FOOD_ACCP, 10)
    target:addPetMod(invaderXim.mod.FOOD_ACC_CAP, 105)
    target:addPetMod(invaderXim.mod.FOOD_RACCP, 10)
    target:addPetMod(invaderXim.mod.FOOD_RACC_CAP, 105)
    target:addPetMod(invaderXim.mod.FOOD_DEFP, 10)
    target:addPetMod(invaderXim.mod.FOOD_DEF_CAP, 100)
    target:addPetMod(invaderXim.mod.HASTE_GEAR, 300)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 20)
    target:delMod(invaderXim.mod.VIT, 5)
    target:delMod(invaderXim.mod.FOOD_ACCP, 10)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 80)
    target:delMod(invaderXim.mod.FOOD_RACCP, 10)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 80)
    target:delPetMod(invaderXim.mod.FOOD_HP, 20)
    target:delPetMod(invaderXim.mod.VIT, 5)
    target:delPetMod(invaderXim.mod.FOOD_ACCP, 10)
    target:delPetMod(invaderXim.mod.FOOD_ACC_CAP, 105)
    target:delPetMod(invaderXim.mod.FOOD_RACCP, 10)
    target:delPetMod(invaderXim.mod.FOOD_RACC_CAP, 105)
    target:delPetMod(invaderXim.mod.FOOD_DEFP, 10)
    target:delPetMod(invaderXim.mod.FOOD_DEF_CAP, 100)
    target:delPetMod(invaderXim.mod.HASTE_GEAR, 300)
end

return itemObject
