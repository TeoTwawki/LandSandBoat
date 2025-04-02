-----------------------------------
-- ID: 4576
-- Item: wizard_cookie
-- Food Effect: 5Min, All Races
-----------------------------------
-- MP Recovered While Healing 7
-- Plantoid Killer 12
-- Slow Resist 12
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 4576)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.MPHEAL, 7)
    target:addMod(invaderXim.mod.PLANTOID_KILLER, 12)
    target:addMod(invaderXim.mod.SLOWRES, 12)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.MPHEAL, 7)
    target:delMod(invaderXim.mod.PLANTOID_KILLER, 12)
    target:delMod(invaderXim.mod.SLOWRES, 12)
end

return itemObject
