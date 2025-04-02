-----------------------------------
-- ID: 6260
-- Item: akamochi
-- Food Effect: 30 Min, All Races
-----------------------------------
-- HP + 20 (Pet & Master)
-- Vitality + 3 (Pet & Master)
-- Acc + 10% Cap: 50 (Pet & Master) Pet Cap: 75
-- R. Acc + 10% Cap: 50 (Pet & Master) Pet Cap: 75
-- Attack + 16% Cap: 50 (Pet & Master) Pet Cap: 75
-- R. Attack + 16% Cap: 50 (Pet & Master) Pet Cap: 75
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 6260)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 20)
    target:addMod(invaderXim.mod.VIT, 3)
    target:addMod(invaderXim.mod.FOOD_ACCP, 10)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 50)
    target:addMod(invaderXim.mod.FOOD_RACCP, 10)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 50)
    target:addMod(invaderXim.mod.FOOD_ATTP, 16)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 50)
    target:addMod(invaderXim.mod.FOOD_RATTP, 16)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 50)
    target:addPetMod(invaderXim.mod.FOOD_HP, 20)
    target:addPetMod(invaderXim.mod.VIT, 3)
    target:addPetMod(invaderXim.mod.FOOD_ACCP, 10)
    target:addPetMod(invaderXim.mod.FOOD_ACC_CAP, 75)
    target:addPetMod(invaderXim.mod.FOOD_RACCP, 10)
    target:addPetMod(invaderXim.mod.FOOD_RACC_CAP, 75)
    target:addPetMod(invaderXim.mod.FOOD_ATTP, 16)
    target:addPetMod(invaderXim.mod.FOOD_ATT_CAP, 75)
    target:addPetMod(invaderXim.mod.FOOD_RATTP, 16)
    target:addPetMod(invaderXim.mod.FOOD_RATT_CAP, 75)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 20)
    target:delMod(invaderXim.mod.VIT, 3)
    target:delMod(invaderXim.mod.FOOD_ACCP, 10)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 50)
    target:delMod(invaderXim.mod.FOOD_RACCP, 10)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 50)
    target:delMod(invaderXim.mod.FOOD_ATTP, 16)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 50)
    target:delMod(invaderXim.mod.FOOD_RATTP, 16)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 50)
    target:delPetMod(invaderXim.mod.FOOD_HP, 20)
    target:delPetMod(invaderXim.mod.VIT, 3)
    target:delPetMod(invaderXim.mod.FOOD_ACCP, 10)
    target:delPetMod(invaderXim.mod.FOOD_ACC_CAP, 75)
    target:delPetMod(invaderXim.mod.FOOD_RACCP, 10)
    target:delPetMod(invaderXim.mod.FOOD_RACC_CAP, 75)
    target:delPetMod(invaderXim.mod.FOOD_ATTP, 16)
    target:delPetMod(invaderXim.mod.FOOD_ATT_CAP, 75)
    target:delPetMod(invaderXim.mod.FOOD_RATTP, 16)
    target:delPetMod(invaderXim.mod.FOOD_RATT_CAP, 75)
end

return itemObject
