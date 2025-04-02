-----------------------------------
-- ID: 5653
-- Item: Cherry Muffin
-- Food Effect: 30Min, All Races
-----------------------------------
-- Intelligence 1
-- Magic % 10
-- Magic Cap 80
-- Agility -1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5653)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.INT, 1)
    target:addMod(invaderXim.mod.FOOD_MPP, 10)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 80)
    target:addMod(invaderXim.mod.AGI, -1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.INT, 1)
    target:delMod(invaderXim.mod.FOOD_MPP, 10)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 80)
    target:delMod(invaderXim.mod.AGI, -1)
end

return itemObject
