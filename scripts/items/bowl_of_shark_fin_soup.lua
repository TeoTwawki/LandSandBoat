-----------------------------------
-- ID: 4452
-- Item: bowl_of_shark_fin_soup
-- Food Effect: 3Hrs, All Races
-----------------------------------
-- HP % 5 (cap 150)
-- MP 5
-- Dexterity 4
-- HP Recovered While Healing 9
-- Attack % 14 (cap 85)
-- Ranged Attack % 14 (cap 85)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4452)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 5)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 150)
    target:addMod(invaderXim.mod.DEX, 4)
    target:addMod(invaderXim.mod.FOOD_MP, 5)
    target:addMod(invaderXim.mod.HPHEAL, 9)
    target:addMod(invaderXim.mod.FOOD_ATTP, 14)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 85)
    target:addMod(invaderXim.mod.FOOD_RATTP, 14)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 85)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 5)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 150)
    target:delMod(invaderXim.mod.DEX, 4)
    target:delMod(invaderXim.mod.FOOD_MP, 5)
    target:delMod(invaderXim.mod.HPHEAL, 9)
    target:delMod(invaderXim.mod.FOOD_ATTP, 14)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 85)
    target:delMod(invaderXim.mod.FOOD_RATTP, 14)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 85)
end

return itemObject
