-----------------------------------
-- ID: 5212
-- Item: dish_of_spaghetti_arrabbiata_+1
-- Food Effect: 60Min, All Races
-----------------------------------
-- HP +17% (cap 150)
-- Strength 5
-- Vitality 2
-- Intelligence -7
-- Attack +23% (cap 100)
-- Ranged Attack +23% (cap 100)
-- Store TP +6
-- Sleep resistance +8
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5212)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 17)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 150)
    target:addMod(invaderXim.mod.STR, 5)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.INT, -7)
    target:addMod(invaderXim.mod.FOOD_ATTP, 23)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 100)
    target:addMod(invaderXim.mod.FOOD_RATTP, 23)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 100)
    target:addMod(invaderXim.mod.STORETP, 6)
    target:addMod(invaderXim.mod.SLEEPRES, 8)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 17)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 150)
    target:delMod(invaderXim.mod.STR, 5)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.INT, -7)
    target:delMod(invaderXim.mod.FOOD_ATTP, 23)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 100)
    target:delMod(invaderXim.mod.FOOD_RATTP, 23)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 100)
    target:delMod(invaderXim.mod.STORETP, 6)
    target:delMod(invaderXim.mod.SLEEPRES, 8)
end

return itemObject
