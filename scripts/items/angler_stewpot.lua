-----------------------------------
-- ID: 5611
-- Item: Angler's Stewpot
-- Food Effect: 3 Hrs, All Races
-----------------------------------
-- TODO: Group Effect
-- HP +10% (cap 200)
-- MP +10
-- HP Recoverd while healing 5
-- MP Recovered while healing 1
-- Accuracy +15% Cap 15
-- Ranged Accuracy 15% Cap 15
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5611)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 10)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 200)
    target:addMod(invaderXim.mod.FOOD_MP, 10)
    target:addMod(invaderXim.mod.HPHEAL, 5)
    target:addMod(invaderXim.mod.MPHEAL, 1)
    target:addMod(invaderXim.mod.FOOD_ACCP, 15)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 15)
    target:addMod(invaderXim.mod.FOOD_RACCP, 15)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 15)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 10)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 200)
    target:delMod(invaderXim.mod.FOOD_MP, 10)
    target:delMod(invaderXim.mod.HPHEAL, 5)
    target:delMod(invaderXim.mod.MPHEAL, 1)
    target:delMod(invaderXim.mod.FOOD_ACCP, 15)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 15)
    target:delMod(invaderXim.mod.FOOD_RACCP, 15)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 15)
end

return itemObject
