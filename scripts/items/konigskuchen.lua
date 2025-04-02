-----------------------------------
-- ID: 5614
-- Item: konigskuchen
-- Food Effect: 180Min, All Races
-----------------------------------
-- Health 8
-- Magic % 3
-- Magic Cap 13
-- Intelligence 2
-- hMP +1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5614)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 8)
    target:addMod(invaderXim.mod.FOOD_MPP, 3)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 13)
    target:addMod(invaderXim.mod.INT, 2)
    target:addMod(invaderXim.mod.MPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 8)
    target:delMod(invaderXim.mod.FOOD_MPP, 3)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 13)
    target:delMod(invaderXim.mod.INT, 2)
    target:delMod(invaderXim.mod.MPHEAL, 1)
end

return itemObject
