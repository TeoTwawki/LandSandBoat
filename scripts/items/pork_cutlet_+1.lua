-----------------------------------
-- ID: 6395
-- Item: pork_cutlet_+1
-- Food Effect: 240Min, All Races
-----------------------------------
-- HP +45
-- STR +8
-- INT -8
-- Fire resistance +21
-- Attack +21% (cap 125)
-- Ranged Attack +21% (cap 125)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 6395)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 45)
    target:addMod(invaderXim.mod.STR, 8)
    target:addMod(invaderXim.mod.INT, -8)
    target:addMod(invaderXim.mod.FIRE_MEVA, 21)
    target:addMod(invaderXim.mod.FOOD_ATTP, 21)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 125)
    target:addMod(invaderXim.mod.FOOD_RATTP, 21)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 125)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 45)
    target:delMod(invaderXim.mod.STR, 8)
    target:delMod(invaderXim.mod.INT, -8)
    target:delMod(invaderXim.mod.FIRE_MEVA, 21)
    target:delMod(invaderXim.mod.FOOD_ATTP, 21)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 125)
    target:delMod(invaderXim.mod.FOOD_RATTP, 21)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 125)
end

return itemObject
