-----------------------------------
-- ID: 5764
-- Item: black_curry_bun+1
-- Food Effect: 60 min, All Races
-----------------------------------
-- TODO: Group effects
-- Dexterity +4
-- Vitality +6
-- Intelligence +3
-- Mind +1
-- Accuracy +7
-- Ranged Accuracy +7
-- Evasion +7
-- Defense +25% (cap 200)
-- Resist Sleep +5
-- hHP +6
-- hMP +3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5764)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 4)
    target:addMod(invaderXim.mod.VIT, 6)
    target:addMod(invaderXim.mod.INT, 3)
    target:addMod(invaderXim.mod.MND, 1)
    target:addMod(invaderXim.mod.ACC, 7)
    target:addMod(invaderXim.mod.RACC, 7)
    target:addMod(invaderXim.mod.EVA, 7)
    target:addMod(invaderXim.mod.FOOD_DEFP, 25)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 200)
    target:addMod(invaderXim.mod.SLEEPRES, 5)
    target:addMod(invaderXim.mod.HPHEAL, 6)
    target:addMod(invaderXim.mod.MPHEAL, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 4)
    target:delMod(invaderXim.mod.VIT, 6)
    target:delMod(invaderXim.mod.INT, 3)
    target:delMod(invaderXim.mod.MND, 1)
    target:delMod(invaderXim.mod.ACC, 7)
    target:delMod(invaderXim.mod.RACC, 7)
    target:delMod(invaderXim.mod.EVA, 7)
    target:delMod(invaderXim.mod.FOOD_DEFP, 25)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 200)
    target:delMod(invaderXim.mod.SLEEPRES, 5)
    target:delMod(invaderXim.mod.HPHEAL, 6)
    target:delMod(invaderXim.mod.MPHEAL, 3)
end

return itemObject
