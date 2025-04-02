-----------------------------------
-- ID: 5940
-- Item: Trail Cookie
-- Food Effect: 5Min, All Races
-----------------------------------
-- MP Healing 5
-- Aquan Killer 12
-- Sleep Resist 10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5940)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.MPHEAL, 5)
    target:addMod(invaderXim.mod.AQUAN_KILLER, 12)
    target:addMod(invaderXim.mod.SLEEPRES, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.MPHEAL, 5)
    target:delMod(invaderXim.mod.AQUAN_KILLER, 12)
    target:delMod(invaderXim.mod.SLEEPRES, 10)
end

return itemObject
