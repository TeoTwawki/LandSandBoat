-----------------------------------
-- ID: 5978
-- Item: Plate of Felicifruit Gelatin
-- Food Effect: 180 Min, All Races
-----------------------------------
-- MP % 5 Cap 100
-- Intelligence +7
-- MP Healing +3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5978)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 5)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 100)
    target:addMod(invaderXim.mod.INT, 7)
    target:addMod(invaderXim.mod.MPHEAL, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 5)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 100)
    target:delMod(invaderXim.mod.INT, 7)
    target:delMod(invaderXim.mod.MPHEAL, 3)
end

return itemObject
