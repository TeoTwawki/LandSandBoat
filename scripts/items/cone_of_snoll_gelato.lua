-----------------------------------
-- ID: 5147
-- Item: cone_of_snoll_gelato
-- Food Effect: 30Min, All Races
-----------------------------------
-- MP % 16 (cap 75)
-- MP Recovered While Healing 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5147)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 16)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 75)
    target:addMod(invaderXim.mod.MPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 16)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 75)
    target:delMod(invaderXim.mod.MPHEAL, 1)
end

return itemObject
