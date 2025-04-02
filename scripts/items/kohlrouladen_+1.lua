-----------------------------------
-- ID: 5761
-- Item: kohlrouladen
-- Food Effect: 4hr, All Races
-----------------------------------
-- Strength 4
-- Agility 4
-- Intelligence -4
-- RACC +10% (cap 65)
-- RATT +16% (cap 70)
-- Enmity -5
-- Subtle Blow +6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5761)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 4)
    target:addMod(invaderXim.mod.AGI, 4)
    target:addMod(invaderXim.mod.INT, -4)
    target:addMod(invaderXim.mod.FOOD_RACCP, 10)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 65)
    target:addMod(invaderXim.mod.FOOD_RATTP, 16)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 70)
    target:addMod(invaderXim.mod.ENMITY, -5)
    target:addMod(invaderXim.mod.SUBTLE_BLOW, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 4)
    target:delMod(invaderXim.mod.AGI, 4)
    target:delMod(invaderXim.mod.INT, -4)
    target:delMod(invaderXim.mod.FOOD_RACCP, 10)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 65)
    target:delMod(invaderXim.mod.FOOD_RATTP, 16)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 70)
    target:delMod(invaderXim.mod.ENMITY, -5)
    target:delMod(invaderXim.mod.SUBTLE_BLOW, 6)
end

return itemObject
