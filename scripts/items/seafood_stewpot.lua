-----------------------------------
-- ID: 5238
-- Item: Seafood Stewpot
-- Food Effect: 3 Hrs, All Races
-----------------------------------
-- TODO: Group Effect
-- HP +10% Cap 50
-- MP +10
-- Accuracy 5
-- Ranged Accuracy 5
-- Evasion 5
-- hHP 5
-- hMP 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5238)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 10)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 50)
    target:addMod(invaderXim.mod.FOOD_MP, 10)
    target:addMod(invaderXim.mod.ACC, 5)
    target:addMod(invaderXim.mod.RACC, 5)
    target:addMod(invaderXim.mod.EVA, 5)
    target:addMod(invaderXim.mod.HPHEAL, 5)
    target:addMod(invaderXim.mod.MPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 10)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 50)
    target:delMod(invaderXim.mod.FOOD_MP, 10)
    target:delMod(invaderXim.mod.ACC, 5)
    target:delMod(invaderXim.mod.RACC, 5)
    target:delMod(invaderXim.mod.EVA, 5)
    target:delMod(invaderXim.mod.HPHEAL, 5)
    target:delMod(invaderXim.mod.MPHEAL, 1)
end

return itemObject
