-----------------------------------
-- ID: 6072
-- Item: Magma Steak +1
-- Food Effect: 240 Min, All Races
-----------------------------------
-- Strength +9
-- Attack +24% Cap 185
-- Ranged Attack +24% Cap 185
-- Vermin Killer +6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 6072)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 9)
    target:addMod(invaderXim.mod.FOOD_ATTP, 24)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 185)
    target:addMod(invaderXim.mod.FOOD_RATTP, 24)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 185)
    target:addMod(invaderXim.mod.VERMIN_KILLER, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 9)
    target:delMod(invaderXim.mod.FOOD_ATTP, 24)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 185)
    target:delMod(invaderXim.mod.FOOD_RATTP, 24)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 185)
    target:delMod(invaderXim.mod.VERMIN_KILLER, 6)
end

return itemObject
