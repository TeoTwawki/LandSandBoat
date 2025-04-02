-----------------------------------
-- ID: 5683
-- Item: humpty_dumpty_effigy
-- Food Effect: 3 hours, All Races
-----------------------------------
-- Max HP % 6 (cap 160)
-- Max MP % 6 (cap 160)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5683)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 6)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 160)
    target:addMod(invaderXim.mod.FOOD_MPP, 6)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 160)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 6)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 160)
    target:delMod(invaderXim.mod.FOOD_MPP, 6)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 160)
end

return itemObject
