-----------------------------------
-- ID: 5199
-- Item: dish_of_spaghetti_carbonara_+1
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health % 14
-- Health Cap 180
-- Magic 15
-- Strength 4
-- Vitality 2
-- Intelligence -3
-- Attack % 17
-- Attack Cap 70
-- Store TP 6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5199)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 14)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 180)
    target:addMod(invaderXim.mod.FOOD_MP, 15)
    target:addMod(invaderXim.mod.STR, 4)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.INT, -3)
    target:addMod(invaderXim.mod.FOOD_ATTP, 17)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 70)
    target:addMod(invaderXim.mod.STORETP, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 14)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 180)
    target:delMod(invaderXim.mod.FOOD_MP, 15)
    target:delMod(invaderXim.mod.STR, 4)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.INT, -3)
    target:delMod(invaderXim.mod.FOOD_ATTP, 17)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 70)
    target:delMod(invaderXim.mod.STORETP, 6)
end

return itemObject
