-----------------------------------
-- ID: 6263
-- Item: kusamochi+1
-- Food Effect: 60 Min, All Races
-----------------------------------
-- HP + 30 (Pet & Master)
-- Vitality + 4 (Pet & Master)
-- Attack + 21% Cap: 77 (Pet & Master) Pet Cap: 120
-- Ranged Attack + 21% Cap: 77 (Pet & Master) Pet Cap: 120
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 6263)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 30)
    target:addMod(invaderXim.mod.VIT, 4)
    target:addMod(invaderXim.mod.FOOD_ATTP, 21)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 77)
    target:addMod(invaderXim.mod.FOOD_RATTP, 21)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 77)
    target:addPetMod(invaderXim.mod.FOOD_HP, 30)
    target:addPetMod(invaderXim.mod.VIT, 4)
    target:addPetMod(invaderXim.mod.FOOD_ATTP, 21)
    target:addPetMod(invaderXim.mod.FOOD_ATT_CAP, 120)
    target:addPetMod(invaderXim.mod.FOOD_RATTP, 21)
    target:addPetMod(invaderXim.mod.FOOD_RATT_CAP, 120)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 30)
    target:delMod(invaderXim.mod.VIT, 4)
    target:delMod(invaderXim.mod.FOOD_ATTP, 21)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 77)
    target:delMod(invaderXim.mod.FOOD_RATTP, 21)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 77)
    target:delPetMod(invaderXim.mod.FOOD_HP, 30)
    target:delPetMod(invaderXim.mod.VIT, 4)
    target:delPetMod(invaderXim.mod.FOOD_ATTP, 21)
    target:delPetMod(invaderXim.mod.FOOD_ATT_CAP, 120)
    target:delPetMod(invaderXim.mod.FOOD_RATTP, 21)
    target:delPetMod(invaderXim.mod.FOOD_RATT_CAP, 120)
end

return itemObject
