-----------------------------------
-- ID: 6396
-- Item: cutlet_sandwich
-- Food Effect: 30Min, All Races
-----------------------------------
-- HP +40
-- STR +7
-- INT -7
-- Fire resistance +20
-- Attack +20% (cap 120)
-- Ranged Attack +20% (cap 120)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 6396)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 40)
    target:addMod(invaderXim.mod.STR, 7)
    target:addMod(invaderXim.mod.INT, -7)
    target:addMod(invaderXim.mod.FIRE_MEVA, 20)
    target:addMod(invaderXim.mod.FOOD_ATTP, 20)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 120)
    target:addMod(invaderXim.mod.FOOD_RATTP, 20)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 120)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 40)
    target:delMod(invaderXim.mod.STR, 7)
    target:delMod(invaderXim.mod.INT, -7)
    target:delMod(invaderXim.mod.FIRE_MEVA, 20)
    target:delMod(invaderXim.mod.FOOD_ATTP, 20)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 120)
    target:delMod(invaderXim.mod.FOOD_RATTP, 20)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 120)
end

return itemObject
