-----------------------------------
-- ID: 6467
-- Item: bowl_of_miso_soup_+1
-- Food Effect: 60Min, All Races
-----------------------------------
-- HP +8% (cap 55)
-- DEX +5
-- AGI +5
-- Accuracy +11% (cap 45)
-- Attack +11% (cap 45)
-- Ranged Accuracy +11% (cap 45)
-- Ranged Attack +11% (cap 45)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 6467)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 8)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 55)
    target:addMod(invaderXim.mod.DEX, 5)
    target:addMod(invaderXim.mod.AGI, 5)
    target:addMod(invaderXim.mod.FOOD_ACCP, 11)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 45)
    target:addMod(invaderXim.mod.FOOD_RACCP, 11)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 45)
    target:addMod(invaderXim.mod.FOOD_ATTP, 11)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 45)
    target:addMod(invaderXim.mod.FOOD_RATTP, 11)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 45)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 8)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 55)
    target:delMod(invaderXim.mod.DEX, 5)
    target:delMod(invaderXim.mod.AGI, 5)
    target:delMod(invaderXim.mod.FOOD_ACCP, 11)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 45)
    target:delMod(invaderXim.mod.FOOD_RACCP, 11)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 45)
    target:delMod(invaderXim.mod.FOOD_ATTP, 11)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 45)
    target:delMod(invaderXim.mod.FOOD_RATTP, 11)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 45)
end

return itemObject
