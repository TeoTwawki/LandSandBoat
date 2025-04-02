-----------------------------------
-- ID: 5233
-- Item: cube_of_cotton_tofu
-- Food Effect: 5Min, All Races
-----------------------------------
-- Health % 10
-- Health Cap 30
-- Magic % 10
-- Magic Cap 30
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5233)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 10)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 30)
    target:addMod(invaderXim.mod.FOOD_MPP, 10)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 30)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 10)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 30)
    target:delMod(invaderXim.mod.FOOD_MPP, 10)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 30)
end

return itemObject
