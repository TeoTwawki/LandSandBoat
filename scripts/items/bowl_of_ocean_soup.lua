-----------------------------------
-- ID: 4285
-- Item: bowl_of_ocean_soup
-- Food Effect: 4Hrs, All Races
-----------------------------------
-- HP +5% (cap 150)
-- MP +5
-- DEX +4
-- Attack +14% (cap 90)
-- Ranged Attack +14% (cap 90)
-- HP recovered while healing +9
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 4285)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 5)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 150)
    target:addMod(invaderXim.mod.FOOD_MP, 5)
    target:addMod(invaderXim.mod.DEX, 4)
    target:addMod(invaderXim.mod.HPHEAL, 9)
    target:addMod(invaderXim.mod.FOOD_ATTP, 14)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 90)
    target:addMod(invaderXim.mod.FOOD_RATTP, 14)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 90)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 5)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 150)
    target:delMod(invaderXim.mod.FOOD_MP, 5)
    target:delMod(invaderXim.mod.DEX, 4)
    target:delMod(invaderXim.mod.HPHEAL, 9)
    target:delMod(invaderXim.mod.FOOD_ATTP, 14)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 90)
    target:delMod(invaderXim.mod.FOOD_RATTP, 14)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 90)
end

return itemObject
