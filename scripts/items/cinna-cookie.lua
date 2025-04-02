-----------------------------------
-- ID: 4397
-- Item: cinna-cookie
-- Food Effect: 3Min, All Races
-----------------------------------
-- Magic Regen While Healing 4
-- Vermin Killer 10
-- Poison Resist 10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 180, 4397)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.MPHEAL, 4)
    target:addMod(invaderXim.mod.VERMIN_KILLER, 10)
    target:addMod(invaderXim.mod.POISONRES, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.MPHEAL, 4)
    target:delMod(invaderXim.mod.VERMIN_KILLER, 10)
    target:delMod(invaderXim.mod.POISONRES, 10)
end

return itemObject
