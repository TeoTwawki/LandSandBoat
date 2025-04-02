-----------------------------------
-- ID: 6343
-- Item: grape_daifuku
-- Food Effect: 30 Min, All Races
-----------------------------------
-- HP + 20 STR + 2 VIT + 3 (Pet & Master)
-- Accuracy/Ranged Accuracy +10% (cap 80 on master, cap 105 on pet)
-- Attack/Ranged Attack +11% (cap 50 on master, cap 75 on pet)
-- Master MAB + 3 , Pet MAB + 14
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 6343)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 20)
    target:addMod(invaderXim.mod.STR, 2)
    target:addMod(invaderXim.mod.VIT, 3)
    target:addMod(invaderXim.mod.FOOD_ACCP, 10)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 80)
    target:addMod(invaderXim.mod.FOOD_ATTP, 10)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 50)
    target:addMod(invaderXim.mod.FOOD_RACCP, 10)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 80)
    target:addMod(invaderXim.mod.FOOD_RATTP, 10)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 50)
    target:addMod(invaderXim.mod.MATT, 3)
    target:addPetMod(invaderXim.mod.FOOD_HP, 20)
    target:addPetMod(invaderXim.mod.STR, 2)
    target:addPetMod(invaderXim.mod.VIT, 3)
    target:addPetMod(invaderXim.mod.FOOD_ACCP, 10)
    target:addPetMod(invaderXim.mod.FOOD_ACC_CAP, 105)
    target:addPetMod(invaderXim.mod.FOOD_ATTP, 10)
    target:addPetMod(invaderXim.mod.FOOD_ATT_CAP, 75)
    target:addPetMod(invaderXim.mod.FOOD_RACCP, 10)
    target:addPetMod(invaderXim.mod.FOOD_RACC_CAP, 105)
    target:addPetMod(invaderXim.mod.FOOD_RATTP, 10)
    target:addPetMod(invaderXim.mod.FOOD_RATT_CAP, 75)
    target:addPetMod(invaderXim.mod.MATT, 14)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 20)
    target:delMod(invaderXim.mod.STR, 2)
    target:delMod(invaderXim.mod.VIT, 3)
    target:delMod(invaderXim.mod.FOOD_ACCP, 10)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 80)
    target:delMod(invaderXim.mod.FOOD_ATTP, 10)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 50)
    target:delMod(invaderXim.mod.FOOD_RACCP, 10)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 80)
    target:delMod(invaderXim.mod.FOOD_RATTP, 10)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 50)
    target:delMod(invaderXim.mod.MATT, 3)
    target:delPetMod(invaderXim.mod.FOOD_HP, 20)
    target:delPetMod(invaderXim.mod.STR, 2)
    target:delPetMod(invaderXim.mod.VIT, 3)
    target:delPetMod(invaderXim.mod.FOOD_ACCP, 10)
    target:delPetMod(invaderXim.mod.FOOD_ACC_CAP, 105)
    target:delPetMod(invaderXim.mod.FOOD_ATTP, 10)
    target:delPetMod(invaderXim.mod.FOOD_ATT_CAP, 75)
    target:delPetMod(invaderXim.mod.FOOD_RACCP, 10)
    target:delPetMod(invaderXim.mod.FOOD_RACC_CAP, 105)
    target:delPetMod(invaderXim.mod.FOOD_RATTP, 10)
    target:delPetMod(invaderXim.mod.FOOD_RATT_CAP, 75)
    target:delPetMod(invaderXim.mod.MATT, 14)
end

return itemObject
