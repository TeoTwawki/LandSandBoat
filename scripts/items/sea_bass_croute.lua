-----------------------------------
-- ID: 4353
-- Item: sea_bass_croute
-- Food Effect: 30Min, All Races
-----------------------------------
-- MP +5% (cap 150)
-- Dexterity 4
-- Mind 5
-- Accuracy 3
-- Ranged Accuracy % 6 (cap 20)
-- HP recovered while healing 9
-- MP recovered while healing 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4353)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 5)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 150)
    target:addMod(invaderXim.mod.DEX, 4)
    target:addMod(invaderXim.mod.MND, 5)
    target:addMod(invaderXim.mod.ACC, 3)
    target:addMod(invaderXim.mod.FOOD_RACCP, 6)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 20)
    target:addMod(invaderXim.mod.HPHEAL, 9)
    target:addMod(invaderXim.mod.MPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 5)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 150)
    target:delMod(invaderXim.mod.DEX, 4)
    target:delMod(invaderXim.mod.MND, 5)
    target:delMod(invaderXim.mod.ACC, 3)
    target:delMod(invaderXim.mod.FOOD_RACCP, 6)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 20)
    target:delMod(invaderXim.mod.HPHEAL, 9)
    target:delMod(invaderXim.mod.MPHEAL, 2)
end

return itemObject
