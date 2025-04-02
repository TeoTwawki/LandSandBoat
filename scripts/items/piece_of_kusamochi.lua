-----------------------------------
-- ID: 6262
-- Item: kusamochi
-- Food Effect: 30 Min, All Races
-----------------------------------
-- HP + 20 (Pet & Master)
-- Vitality + 3 (Pet & Master)
-- Attack + 20% Cap: 72 (Pet & Master) Pet Cap: 113
-- Ranged Attack + 20% Cap: 72 (Pet & Master) Pet Cap: 113
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 6262)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 20)
    target:addMod(invaderXim.mod.VIT, 3)
    target:addMod(invaderXim.mod.FOOD_ATTP, 20)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 72)
    target:addMod(invaderXim.mod.FOOD_RATTP, 20)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 72)
    target:addPetMod(invaderXim.mod.FOOD_HP, 20)
    target:addPetMod(invaderXim.mod.VIT, 3)
    target:addPetMod(invaderXim.mod.FOOD_ATTP, 20)
    target:addPetMod(invaderXim.mod.FOOD_ATT_CAP, 113)
    target:addPetMod(invaderXim.mod.FOOD_RATTP, 20)
    target:addPetMod(invaderXim.mod.FOOD_RATT_CAP, 113)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 20)
    target:delMod(invaderXim.mod.VIT, 3)
    target:delMod(invaderXim.mod.FOOD_ATTP, 20)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 72)
    target:delMod(invaderXim.mod.FOOD_RATTP, 20)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 72)
    target:delPetMod(invaderXim.mod.FOOD_HP, 20)
    target:delPetMod(invaderXim.mod.VIT, 3)
    target:delPetMod(invaderXim.mod.FOOD_ATTP, 20)
    target:delPetMod(invaderXim.mod.FOOD_ATT_CAP, 113)
    target:delPetMod(invaderXim.mod.FOOD_RATTP, 20)
    target:delPetMod(invaderXim.mod.FOOD_RATT_CAP, 113)
end

return itemObject
