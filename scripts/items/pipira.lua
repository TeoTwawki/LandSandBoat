-----------------------------------
-- ID: 5787
-- Item: pipira
-- Food Effect: 5Min, Mithra only
-----------------------------------
-- Dexterity 2
-- Mind -4
-- Attack % 14.5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.RAW_FISH)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5787)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 2)
    target:addMod(invaderXim.mod.MND, -4)
    target:addMod(invaderXim.mod.FOOD_ATTP, 14)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 60)
    target:addMod(invaderXim.mod.FOOD_RATTP, 14)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 60)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 2)
    target:delMod(invaderXim.mod.MND, -4)
    target:delMod(invaderXim.mod.FOOD_ATTP, 14)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 60)
    target:delMod(invaderXim.mod.FOOD_RATTP, 14)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 60)
end

return itemObject
