-----------------------------------
-- ID: 6259
-- Item: piece_of_shiromochi_+1
-- Food Effect: 60 Min, All Races
-----------------------------------
-- HP + 30 VIT + 4 (Pet & Master)
-- Accuracy/Ranged Accuracy +15% (cap 74 on master, cap 114 on pet)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 6259)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 30)
    target:addMod(invaderXim.mod.VIT, 4)
    target:addMod(invaderXim.mod.FOOD_ACCP, 15)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 74)
    target:addMod(invaderXim.mod.FOOD_RACCP, 15)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 74)
    target:addPetMod(invaderXim.mod.FOOD_HP, 30)
    target:addPetMod(invaderXim.mod.VIT, 4)
    target:addPetMod(invaderXim.mod.FOOD_ACCP, 15)
    target:addPetMod(invaderXim.mod.FOOD_ACC_CAP, 114)
    target:addPetMod(invaderXim.mod.FOOD_RACCP, 15)
    target:addPetMod(invaderXim.mod.FOOD_RACC_CAP, 114)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 30)
    target:delMod(invaderXim.mod.VIT, 4)
    target:delMod(invaderXim.mod.FOOD_ACCP, 15)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 74)
    target:delMod(invaderXim.mod.FOOD_RACCP, 15)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 74)
    target:delPetMod(invaderXim.mod.FOOD_HP, 30)
    target:delPetMod(invaderXim.mod.VIT, 4)
    target:delPetMod(invaderXim.mod.FOOD_ACCP, 15)
    target:delPetMod(invaderXim.mod.FOOD_ACC_CAP, 114)
    target:delPetMod(invaderXim.mod.FOOD_RACCP, 15)
    target:delPetMod(invaderXim.mod.FOOD_RACC_CAP, 114)
end

return itemObject
