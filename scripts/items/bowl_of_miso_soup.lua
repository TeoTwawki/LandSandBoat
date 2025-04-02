-----------------------------------
-- ID: 6466
-- Item: bowl_of_miso_soup
-- Food Effect: 30Min, All Races
-----------------------------------
-- HP +7% (cap 50)
-- DEX +4
-- AGI +4
-- Accuracy +10% (cap 40)
-- Attack +10% (cap 40)
-- Ranged Accuracy +10% (cap 40)
-- Ranged Attack +10% (cap 40)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 6466)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 7)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 50)
    target:addMod(invaderXim.mod.DEX, 4)
    target:addMod(invaderXim.mod.AGI, 4)
    target:addMod(invaderXim.mod.FOOD_ACCP, 10)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 40)
    target:addMod(invaderXim.mod.FOOD_RACCP, 10)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 40)
    target:addMod(invaderXim.mod.FOOD_ATTP, 10)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 40)
    target:addMod(invaderXim.mod.FOOD_RATTP, 10)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 40)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 7)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 50)
    target:delMod(invaderXim.mod.DEX, 4)
    target:delMod(invaderXim.mod.AGI, 4)
    target:delMod(invaderXim.mod.FOOD_ACCP, 10)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 40)
    target:delMod(invaderXim.mod.FOOD_RACCP, 10)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 40)
    target:delMod(invaderXim.mod.FOOD_ATTP, 10)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 40)
    target:delMod(invaderXim.mod.FOOD_RATTP, 10)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 40)
end

return itemObject
