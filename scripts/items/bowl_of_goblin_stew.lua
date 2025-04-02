-----------------------------------
-- ID: 4465
-- Item: bowl_of_goblin_stew
-- Food Effect: 3Hrs, All Races
-----------------------------------
-- Dexterity -4
-- Attack +16% (cap 80)
-- Ranged Attack +16% (cap 80)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4465)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, -4)
    target:addMod(invaderXim.mod.FOOD_ATTP, 16)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 80)
    target:addMod(invaderXim.mod.FOOD_RATTP, 16)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 80)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, -4)
    target:delMod(invaderXim.mod.FOOD_ATTP, 16)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 80)
    target:delMod(invaderXim.mod.FOOD_RATTP, 16)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 80)
end

return itemObject
