-----------------------------------
--  ID: 5682
--  Item: Purple Polypore
--  Food Effect: 5 Min, All Races
-----------------------------------
--  Strength -6
--  Mind +4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5682)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, -6)
    target:addMod(invaderXim.mod.MND, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, -6)
    target:delMod(invaderXim.mod.MND, 4)
end

return itemObject
