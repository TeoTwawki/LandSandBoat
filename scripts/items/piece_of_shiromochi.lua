-----------------------------------
-- ID: 6258
-- Item: piece_of_shiromochi
-- Food Effect: 30 Min, All Races
-----------------------------------
-- HP + 20 VIT + 3 (Pet & Master)
-- Accuracy/Ranged Accuracy +14% (cap 70 on master, cap 108 on pet)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 6258)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 20)
    target:addMod(invaderXim.mod.VIT, 3)
    target:addMod(invaderXim.mod.FOOD_ACCP, 14)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 70)
    target:addMod(invaderXim.mod.FOOD_RACCP, 14)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 70)
    target:addPetMod(invaderXim.mod.FOOD_HP, 20)
    target:addPetMod(invaderXim.mod.VIT, 3)
    target:addPetMod(invaderXim.mod.FOOD_ACCP, 14)
    target:addPetMod(invaderXim.mod.FOOD_ACC_CAP, 108)
    target:addPetMod(invaderXim.mod.FOOD_RACCP, 14)
    target:addPetMod(invaderXim.mod.FOOD_RACC_CAP, 108)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 20)
    target:delMod(invaderXim.mod.VIT, 3)
    target:delMod(invaderXim.mod.FOOD_ACCP, 14)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 70)
    target:delMod(invaderXim.mod.FOOD_RACCP, 14)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 70)
    target:delPetMod(invaderXim.mod.FOOD_HP, 20)
    target:delPetMod(invaderXim.mod.VIT, 3)
    target:delPetMod(invaderXim.mod.FOOD_ACCP, 14)
    target:delPetMod(invaderXim.mod.FOOD_ACC_CAP, 108)
    target:delPetMod(invaderXim.mod.FOOD_RACCP, 14)
    target:delPetMod(invaderXim.mod.FOOD_RACC_CAP, 108)
end

return itemObject
