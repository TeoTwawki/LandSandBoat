-----------------------------------
-- ID: 5758
-- Item: black_curry_bun
-- Food Effect: 30minutes, All Races
-----------------------------------
-- TODO: Group effects
-- DEX +2
-- VIT +4
-- INT +1
-- Accuracy +5
-- Ranged Accuracy +5
-- Evasion +5
-- DEF +15% (cap 180)
-- Resist Sleep +3
-- hHP +2
-- hMP +1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5758)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 2)
    target:addMod(invaderXim.mod.VIT, 4)
    target:addMod(invaderXim.mod.INT, 1)
    target:addMod(invaderXim.mod.ACC, 5)
    target:addMod(invaderXim.mod.RACC, 5)
    target:addMod(invaderXim.mod.EVA, 5)
    target:addMod(invaderXim.mod.FOOD_DEFP, 15)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 180)
    target:addMod(invaderXim.mod.SLEEPRES, 3)
    target:addMod(invaderXim.mod.HPHEAL, 2)
    target:addMod(invaderXim.mod.MPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 2)
    target:delMod(invaderXim.mod.VIT, 4)
    target:delMod(invaderXim.mod.INT, 1)
    target:delMod(invaderXim.mod.ACC, 5)
    target:delMod(invaderXim.mod.RACC, 5)
    target:delMod(invaderXim.mod.EVA, 5)
    target:delMod(invaderXim.mod.FOOD_DEFP, 15)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 180)
    target:delMod(invaderXim.mod.SLEEPRES, 3)
    target:delMod(invaderXim.mod.HPHEAL, 2)
    target:delMod(invaderXim.mod.MPHEAL, 1)
end

return itemObject
