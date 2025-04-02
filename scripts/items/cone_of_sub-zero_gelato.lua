-----------------------------------
-- ID: 5155
-- Item: cone_of_sub-zero_gelato
-- Food Effect: 1Hr, All Races
-----------------------------------
-- HP 10
-- MP % 16 (cap 80)
-- MP Recovered While Healing 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5155)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 10)
    target:addMod(invaderXim.mod.FOOD_MPP, 16)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 80)
    target:addMod(invaderXim.mod.MPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 10)
    target:delMod(invaderXim.mod.FOOD_MPP, 16)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 80)
    target:delMod(invaderXim.mod.MPHEAL, 2)
end

return itemObject
