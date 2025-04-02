-----------------------------------
-- ID: 5773
-- Item: mushroom_crepe
-- Food Effect: 30Min, All Races
-----------------------------------
-- Mind 2
-- MP % 10 (cap 30)
-- Magic Accuracy +10
-- Magic Def. Bonus +5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5773)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.MND, 2)
    target:addMod(invaderXim.mod.FOOD_MPP, 10)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 30)
    target:addMod(invaderXim.mod.MACC, 10)
    target:addMod(invaderXim.mod.MDEF, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.MND, 2)
    target:delMod(invaderXim.mod.FOOD_MPP, 10)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 30)
    target:delMod(invaderXim.mod.MACC, 10)
    target:delMod(invaderXim.mod.MDEF, 5)
end

return itemObject
