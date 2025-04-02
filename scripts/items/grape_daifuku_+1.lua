-----------------------------------
-- ID: 6344
-- Item: grape_daifuku+1
-- Food Effect: 60 Min, All Races
-----------------------------------
-- HP + 30 STR + 3 VIT + 4 (Pet & Master)
-- Accuracy/Ranged Accuracy +11% (cap 85 on master, cap 110 on pet)
-- Attack/Ranged Attack +11% (cap 55 on master, cap 80 on pet)
-- Master MAB + 4 , Pet MAB + 15
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 6344)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 30)
    target:addMod(invaderXim.mod.STR, 3)
    target:addMod(invaderXim.mod.VIT, 4)
    target:addMod(invaderXim.mod.FOOD_ACCP, 11)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 85)
    target:addMod(invaderXim.mod.FOOD_ATTP, 11)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 55)
    target:addMod(invaderXim.mod.FOOD_RACCP, 11)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 85)
    target:addMod(invaderXim.mod.FOOD_RATTP, 11)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 55)
    target:addMod(invaderXim.mod.MATT, 4)
    target:addPetMod(invaderXim.mod.FOOD_HP, 30)
    target:addPetMod(invaderXim.mod.STR, 3)
    target:addPetMod(invaderXim.mod.VIT, 4)
    target:addPetMod(invaderXim.mod.FOOD_ACCP, 11)
    target:addPetMod(invaderXim.mod.FOOD_ACC_CAP, 110)
    target:addPetMod(invaderXim.mod.FOOD_ATTP, 11)
    target:addPetMod(invaderXim.mod.FOOD_ATT_CAP, 80)
    target:addPetMod(invaderXim.mod.FOOD_RACCP, 11)
    target:addPetMod(invaderXim.mod.FOOD_RACC_CAP, 110)
    target:addPetMod(invaderXim.mod.FOOD_RATTP, 11)
    target:addPetMod(invaderXim.mod.FOOD_RATT_CAP, 80)
    target:addPetMod(invaderXim.mod.MATT, 15)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 30)
    target:delMod(invaderXim.mod.STR, 3)
    target:delMod(invaderXim.mod.VIT, 4)
    target:delMod(invaderXim.mod.FOOD_ACCP, 11)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 85)
    target:delMod(invaderXim.mod.FOOD_ATTP, 11)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 55)
    target:delMod(invaderXim.mod.FOOD_RACCP, 11)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 85)
    target:delMod(invaderXim.mod.FOOD_RATTP, 11)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 55)
    target:delMod(invaderXim.mod.MATT, 4)
    target:delPetMod(invaderXim.mod.FOOD_HP, 30)
    target:delPetMod(invaderXim.mod.STR, 3)
    target:delPetMod(invaderXim.mod.VIT, 4)
    target:delPetMod(invaderXim.mod.FOOD_ACCP, 11)
    target:delPetMod(invaderXim.mod.FOOD_ACC_CAP, 110)
    target:delPetMod(invaderXim.mod.FOOD_ATTP, 11)
    target:delPetMod(invaderXim.mod.FOOD_ATT_CAP, 80)
    target:delPetMod(invaderXim.mod.FOOD_RACCP, 11)
    target:delPetMod(invaderXim.mod.FOOD_RACC_CAP, 110)
    target:delPetMod(invaderXim.mod.FOOD_RATTP, 11)
    target:delPetMod(invaderXim.mod.FOOD_RATT_CAP, 80)
    target:delPetMod(invaderXim.mod.MATT, 15)
end

return itemObject
