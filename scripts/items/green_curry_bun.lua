-----------------------------------
-- ID: 5756
-- Item: green_curry_bun
-- Food Effect: 30 min, All Races
-----------------------------------
-- TODO: Group effects
-- VIT +1
-- AGI +2
-- Ranged Accuracy +5% (cap 25)
-- DEF +9% (cap 160)
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
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5756)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.VIT, 1)
    target:addMod(invaderXim.mod.AGI, 2)
    target:addMod(invaderXim.mod.FOOD_RACCP, 5)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 25)
    target:addMod(invaderXim.mod.FOOD_DEFP, 9)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 160)
    target:addMod(invaderXim.mod.SLEEPRES, 3)
    target:addMod(invaderXim.mod.HPHEAL, 2)
    target:addMod(invaderXim.mod.MPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.VIT, 1)
    target:delMod(invaderXim.mod.AGI, 2)
    target:delMod(invaderXim.mod.FOOD_RACCP, 5)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 25)
    target:delMod(invaderXim.mod.FOOD_DEFP, 9)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 160)
    target:delMod(invaderXim.mod.SLEEPRES, 3)
    target:delMod(invaderXim.mod.HPHEAL, 2)
    target:delMod(invaderXim.mod.MPHEAL, 1)
end

return itemObject
