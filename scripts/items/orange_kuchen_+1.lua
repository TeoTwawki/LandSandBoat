-----------------------------------
-- ID: 4332
-- Item: orange_kuchen_+1
-- Food Effect: 4Hrs, All Races
-----------------------------------
-- MP % 13 (cap 80)
-- MP Recovered While Healing 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 4332)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 13)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 80)
    target:addMod(invaderXim.mod.MPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 13)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 80)
    target:delMod(invaderXim.mod.MPHEAL, 1)
end

return itemObject
