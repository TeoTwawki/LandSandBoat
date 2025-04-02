-----------------------------------
-- ID: 5925
-- Item: Charred Salisbury Steak
-- Food Effect: 240 Min, All Races
-----------------------------------
-- HP +32
-- Strength +8
-- Intelligence -6
-- Attack % 22 Cap 165
-- Ranged Attack %22 Cap 165
-- Dragon Killer +5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5925)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 32)
    target:addMod(invaderXim.mod.STR, 8)
    target:addMod(invaderXim.mod.INT, -6)
    target:addMod(invaderXim.mod.FOOD_ATTP, 22)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 165)
    target:addMod(invaderXim.mod.FOOD_RATTP, 22)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 165)
    target:addMod(invaderXim.mod.DRAGON_KILLER, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 32)
    target:delMod(invaderXim.mod.STR, 8)
    target:delMod(invaderXim.mod.INT, -6)
    target:delMod(invaderXim.mod.FOOD_ATTP, 22)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 165)
    target:delMod(invaderXim.mod.FOOD_RATTP, 22)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 165)
    target:delMod(invaderXim.mod.DRAGON_KILLER, 5)
end

return itemObject
