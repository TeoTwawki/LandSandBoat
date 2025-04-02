-----------------------------------
-- ID: 5860
-- Item: galkan_sausage_+2
-- Food Effect: 30Min, All Races
-----------------------------------
-- Strength 5
-- Intelligence -6
-- Attack 11
-- Ranged Attack 11
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5860)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 5)
    target:addMod(invaderXim.mod.INT, -6)
    target:addMod(invaderXim.mod.ATT, 11)
    target:addMod(invaderXim.mod.RATT, 11)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 5)
    target:delMod(invaderXim.mod.INT, -6)
    target:delMod(invaderXim.mod.ATT, 11)
    target:delMod(invaderXim.mod.RATT, 11)
end

return itemObject
