-----------------------------------
-- ID: 5859
-- Item: galkan_sausage_+1
-- Food Effect: 30Min, All Races
-----------------------------------
-- Strength 4
-- Intelligence -5
-- Attack 10
-- Ranged Attack 10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5859)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 4)
    target:addMod(invaderXim.mod.INT, -5)
    target:addMod(invaderXim.mod.ATT, 10)
    target:addMod(invaderXim.mod.RATT, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 4)
    target:delMod(invaderXim.mod.INT, -5)
    target:delMod(invaderXim.mod.ATT, 10)
    target:delMod(invaderXim.mod.RATT, 10)
end

return itemObject
