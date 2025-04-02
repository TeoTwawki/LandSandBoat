-----------------------------------
-- ID: 6261
-- Item: akamochi+1
-- Food Effect: 60 Min, All Races
-----------------------------------
-- HP + 30 (Pet & Master)
-- Vitality + 4 (Pet & Master)
-- Attack + 17% Cap: 54 (Pet & Master) Pet Cap: 81
-- Accuracy + 11% Cap: 54 (Pet & Master) Pet Cap: 81
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 6261)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 30)
    target:addMod(invaderXim.mod.VIT, 4)
    target:addMod(invaderXim.mod.FOOD_ACCP, 11)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 54)
    target:addMod(invaderXim.mod.FOOD_RACCP, 11)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 54)
    target:addMod(invaderXim.mod.FOOD_ATTP, 17)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 54)
    target:addMod(invaderXim.mod.FOOD_RATTP, 17)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 54)
    target:addPetMod(invaderXim.mod.FOOD_HP, 30)
    target:addPetMod(invaderXim.mod.VIT, 4)
    target:addPetMod(invaderXim.mod.FOOD_ACCP, 11)
    target:addPetMod(invaderXim.mod.FOOD_ACC_CAP, 81)
    target:addPetMod(invaderXim.mod.FOOD_RACCP, 11)
    target:addPetMod(invaderXim.mod.FOOD_RACC_CAP, 81)
    target:addPetMod(invaderXim.mod.FOOD_ATTP, 17)
    target:addPetMod(invaderXim.mod.FOOD_ATT_CAP, 82)
    target:addPetMod(invaderXim.mod.FOOD_RATTP, 17)
    target:addPetMod(invaderXim.mod.FOOD_RATT_CAP, 82)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 30)
    target:delMod(invaderXim.mod.VIT, 4)
    target:delMod(invaderXim.mod.FOOD_ACCP, 11)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 54)
    target:delMod(invaderXim.mod.FOOD_RACCP, 11)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 54)
    target:delMod(invaderXim.mod.FOOD_ATTP, 17)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 54)
    target:delMod(invaderXim.mod.FOOD_RATTP, 17)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 54)
    target:delPetMod(invaderXim.mod.FOOD_HP, 30)
    target:delPetMod(invaderXim.mod.VIT, 4)
    target:delPetMod(invaderXim.mod.FOOD_ACCP, 11)
    target:delPetMod(invaderXim.mod.FOOD_ACC_CAP, 81)
    target:delPetMod(invaderXim.mod.FOOD_RACCP, 11)
    target:delPetMod(invaderXim.mod.FOOD_RACC_CAP, 81)
    target:delPetMod(invaderXim.mod.FOOD_ATTP, 17)
    target:delPetMod(invaderXim.mod.FOOD_ATT_CAP, 82)
    target:delPetMod(invaderXim.mod.FOOD_RATTP, 17)
    target:delPetMod(invaderXim.mod.FOOD_RATT_CAP, 82)
end

return itemObject
