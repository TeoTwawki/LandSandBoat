-----------------------------------
-- ID: 5861
-- Item: galkan_sausage_+3
-- Food Effect: 30Min, All Races
-----------------------------------
-- Strength 6
-- Intelligence -7
-- Attack 12
-- Ranged Attack 12
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5861)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 6)
    target:addMod(invaderXim.mod.INT, -7)
    target:addMod(invaderXim.mod.ATT, 12)
    target:addMod(invaderXim.mod.RATT, 12)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 6)
    target:delMod(invaderXim.mod.INT, -7)
    target:delMod(invaderXim.mod.ATT, 12)
    target:delMod(invaderXim.mod.RATT, 12)
end

return itemObject
