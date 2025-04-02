-----------------------------------
-- ID: 4395
-- Item: galkan_sausage
-- Food Effect: 30Min, All Races
-----------------------------------
-- Multi-Race Effects
-- Galka
-- Strength 3
-- Intelligence -1
-- Attack % 25
-- Attack Cap 30
-- Ranged ATT % 25
-- Ranged ATT Cap 30
--
-- Other
-- Strength 3
-- Intelligence -4
-- Attack 9
-- Ranged ATT  9
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4395)
end

itemObject.onEffectGain = function(target, effect)
    if target:getRace() ~= invaderXim.race.GALKA then
        target:addMod(invaderXim.mod.STR, 3)
        target:addMod(invaderXim.mod.INT, -4)
        target:addMod(invaderXim.mod.ATT, 9)
        target:addMod(invaderXim.mod.RATT, 9)
    else
        target:addMod(invaderXim.mod.STR, 3)
        target:addMod(invaderXim.mod.INT, -1)
        target:addMod(invaderXim.mod.FOOD_ATTP, 25)
        target:addMod(invaderXim.mod.FOOD_ATT_CAP, 30)
        target:addMod(invaderXim.mod.FOOD_RATTP, 25)
        target:addMod(invaderXim.mod.FOOD_RATT_CAP, 30)
    end
end

itemObject.onEffectLose = function(target, effect)
    if target:getRace() ~= invaderXim.race.GALKA then
        target:delMod(invaderXim.mod.STR, 3)
        target:delMod(invaderXim.mod.INT, -4)
        target:delMod(invaderXim.mod.ATT, 9)
        target:delMod(invaderXim.mod.RATT, 9)
    else
        target:delMod(invaderXim.mod.STR, 3)
        target:delMod(invaderXim.mod.INT, -1)
        target:delMod(invaderXim.mod.FOOD_ATTP, 25)
        target:delMod(invaderXim.mod.FOOD_ATT_CAP, 30)
        target:delMod(invaderXim.mod.FOOD_RATTP, 25)
        target:delMod(invaderXim.mod.FOOD_RATT_CAP, 30)
    end
end

return itemObject
