-----------------------------------
-- ID: 5753
-- Item: Pot-au-feu
-- Food Effect: 30Min, All Races
-----------------------------------
-- Strength 4
-- Agility 4
-- Intelligence -3
-- Ranged Attk % 16 Cap 65
-- Ranged ACC % 11 Cap 55
-- Enmity -3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5753)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 4)
    target:addMod(invaderXim.mod.AGI, 4)
    target:addMod(invaderXim.mod.INT, -3)
    target:addMod(invaderXim.mod.FOOD_RATTP, 16)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 65)
    target:addMod(invaderXim.mod.FOOD_RACCP, 11)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 55)
    target:addMod(invaderXim.mod.ENMITY, -3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 4)
    target:delMod(invaderXim.mod.AGI, 4)
    target:delMod(invaderXim.mod.INT, -3)
    target:delMod(invaderXim.mod.FOOD_RATTP, 16)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 65)
    target:delMod(invaderXim.mod.FOOD_RACCP, 11)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 55)
    target:delMod(invaderXim.mod.ENMITY, -3)
end

return itemObject
