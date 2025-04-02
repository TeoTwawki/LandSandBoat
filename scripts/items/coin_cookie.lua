-----------------------------------
-- ID: 4520
-- Item: coin_cookie
-- Food Effect: 5Min, All Races
-----------------------------------
-- Magic Regen While Healing 6
-- Vermin Killer 12
-- Poison Resist 12
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 4520)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.MPHEAL, 6)
    target:addMod(invaderXim.mod.VERMIN_KILLER, 12)
    target:addMod(invaderXim.mod.POISONRES, 12)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.MPHEAL, 6)
    target:delMod(invaderXim.mod.VERMIN_KILLER, 12)
    target:delMod(invaderXim.mod.POISONRES, 12)
end

return itemObject
