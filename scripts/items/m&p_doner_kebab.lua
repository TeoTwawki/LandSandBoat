-----------------------------------
-- ID: 5717
-- Item: M&P Doner Kabob
-- Food Effect: 5Min, All Races
-----------------------------------
-- HP 5% (cap 150)
-- MP 5% (cap 150)
-- hHP +2
-- hMP +2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5717)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 5)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 150)
    target:addMod(invaderXim.mod.FOOD_MPP, 5)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 150)
    target:addMod(invaderXim.mod.HPHEAL, 2)
    target:addMod(invaderXim.mod.MPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 5)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 150)
    target:delMod(invaderXim.mod.FOOD_MPP, 5)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 150)
    target:delMod(invaderXim.mod.HPHEAL, 2)
    target:delMod(invaderXim.mod.MPHEAL, 2)
end

return itemObject
