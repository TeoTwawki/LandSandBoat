-----------------------------------
-- ID: 5979
-- Item: Plate of Dulcet Panettones
-- Food Effect: 240 Min, All Races
-----------------------------------
-- MP % 6 Cap 105
-- Intelligence +8
-- MP Healing +4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5979)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 6)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 105)
    target:addMod(invaderXim.mod.INT, 8)
    target:addMod(invaderXim.mod.MPHEAL, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 6)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 105)
    target:delMod(invaderXim.mod.INT, 8)
    target:delMod(invaderXim.mod.MPHEAL, 4)
end

return itemObject
