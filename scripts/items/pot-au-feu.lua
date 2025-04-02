-----------------------------------
-- ID: 5752
-- Item: Pot-au-feu
-- Food Effect: 30Min, All Races
-----------------------------------
-- Strength 3
-- Agility 3
-- Intelligence -3
-- Ranged Attk % 15 Cap 60
-- Ranged ACC % 10 Cap 50
-- Enmity -3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5752)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 3)
    target:addMod(invaderXim.mod.AGI, 3)
    target:addMod(invaderXim.mod.INT, -3)
    target:addMod(invaderXim.mod.FOOD_RATTP, 15)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 60)
    target:addMod(invaderXim.mod.FOOD_RACCP, 10)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 50)
    target:addMod(invaderXim.mod.ENMITY, -3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 3)
    target:delMod(invaderXim.mod.AGI, 3)
    target:delMod(invaderXim.mod.INT, -3)
    target:delMod(invaderXim.mod.FOOD_RATTP, 15)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 60)
    target:delMod(invaderXim.mod.FOOD_RACCP, 10)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 50)
    target:delMod(invaderXim.mod.ENMITY, -3)
end

return itemObject
