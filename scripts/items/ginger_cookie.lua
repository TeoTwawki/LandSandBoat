-----------------------------------
-- ID: 4394
-- Item: ginger_cookie
-- Food Effect: 3Min, All Races
-----------------------------------
-- Magic Regen While Healing 5
-- Plantoid Killer 10
-- Slow Resist 10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 180, 4394)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.MPHEAL, 5)
    target:addMod(invaderXim.mod.PLANTOID_KILLER, 10)
    target:addMod(invaderXim.mod.SLOWRES, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.MPHEAL, 5)
    target:delMod(invaderXim.mod.PLANTOID_KILLER, 10)
    target:delMod(invaderXim.mod.SLOWRES, 10)
end

return itemObject
