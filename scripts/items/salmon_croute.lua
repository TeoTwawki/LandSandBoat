-----------------------------------
-- ID: 4551
-- Item: salmon_croute
-- Food Effect: 30Min, All Races
-----------------------------------
-- MP +3% (cap 130)
-- Dexterity 2
-- MND -2
-- Ranged Accuracy +6% (cap 15)
-- HP recovered while healing 2
-- MP recovered while healing 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4551)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 3)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 130)
    target:addMod(invaderXim.mod.DEX, 2)
    target:addMod(invaderXim.mod.MND, -2)
    target:addMod(invaderXim.mod.FOOD_RACCP, 6)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 15)
    target:addMod(invaderXim.mod.HPHEAL, 2)
    target:addMod(invaderXim.mod.MPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 3)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 130)
    target:delMod(invaderXim.mod.DEX, 2)
    target:delMod(invaderXim.mod.MND, -2)
    target:delMod(invaderXim.mod.FOOD_RACCP, 6)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 15)
    target:delMod(invaderXim.mod.HPHEAL, 2)
    target:delMod(invaderXim.mod.MPHEAL, 1)
end

return itemObject
