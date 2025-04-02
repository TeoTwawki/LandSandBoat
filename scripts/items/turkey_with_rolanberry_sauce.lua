-----------------------------------
-- ID: 6576
-- Item: rolanberry_turkey
-- Food Effect: 4 Hours, All Races
-----------------------------------
-- STR +10
-- Attack +20% (Max. 120)
-- Ranged Attack +20% (Max. 120)
-- "Counter" +10
-- "Resist Amnesia" +10
-- https://www.bg-wiki.com/ffxi/Rol._Turkey
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 6576)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 10)
    target:addMod(invaderXim.mod.FOOD_ATTP, 20)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 120)
    target:addMod(invaderXim.mod.FOOD_RATTP, 20)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 120)
    target:addMod(invaderXim.mod.COUNTER, 10)
    target:addMod(invaderXim.mod.AMNESIARES, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 10)
    target:delMod(invaderXim.mod.FOOD_ATTP, 20)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 120)
    target:delMod(invaderXim.mod.FOOD_RATTP, 20)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 120)
    target:delMod(invaderXim.mod.COUNTER, 10)
    target:delMod(invaderXim.mod.AMNESIARES, 10)
end

return itemObject
