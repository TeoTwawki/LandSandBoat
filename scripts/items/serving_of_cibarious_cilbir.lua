-----------------------------------
-- ID: 5643
-- Item: serving_of_cibarious_cilbir
-- Food Effect: 4Hrs, All Races
-----------------------------------
-- HP % 6 (cap 150)
-- MP % 6 (cap 100)
-- HP recovered while healing 3
-- MP recovered while healing 4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5643)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 6)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 150)
    target:addMod(invaderXim.mod.FOOD_MPP, 6)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 100)
    target:addMod(invaderXim.mod.MPHEAL, 4)
    target:addMod(invaderXim.mod.HPHEAL, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 6)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 150)
    target:delMod(invaderXim.mod.FOOD_MPP, 6)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 100)
    target:delMod(invaderXim.mod.MPHEAL, 4)
    target:delMod(invaderXim.mod.HPHEAL, 3)
end

return itemObject
