-----------------------------------
-- ID: 5230
-- Item: love_chocolate
-- Food Effect: 180Min, All Races
-----------------------------------
-- Magic Regen While Healing 4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5230)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.MPHEAL, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.MPHEAL, 4)
end

return itemObject
