-----------------------------------
-- ID: 5774
-- Item: crepe_forestiere
-- Food Effect: 30Min, All Races
-----------------------------------
-- Mind 2
-- MP % 10 (cap 35)
-- Magic Accuracy +15
-- Magic Def. Bonus +6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5774)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.MND, 2)
    target:addMod(invaderXim.mod.FOOD_MPP, 10)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 35)
    target:addMod(invaderXim.mod.MACC, 15)
    target:addMod(invaderXim.mod.MDEF, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.MND, 2)
    target:delMod(invaderXim.mod.FOOD_MPP, 10)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 35)
    target:delMod(invaderXim.mod.MACC, 15)
    target:delMod(invaderXim.mod.MDEF, 6)
end

return itemObject
