-----------------------------------
-- ID: 4283
-- Item: cup_of_choco-delight
-- Food Effect: 240Min, All Races
-----------------------------------
-- Magic Regen While Healing 5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 4283)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.MPHEAL, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.MPHEAL, 5)
end

return itemObject
