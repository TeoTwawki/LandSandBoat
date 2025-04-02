-----------------------------------
-- ID: 5762
-- Item: green_curry_bun_+1
-- Food Effect: 60 min, All Races
-----------------------------------
-- TODO: Group effects
-- VIT +3
-- AGI +4
-- Ranged Accuracy +10% (cap 25)
-- DEF +13% (cap 180)
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
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5762)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.VIT, 3)
    target:addMod(invaderXim.mod.AGI, 4)
    target:addMod(invaderXim.mod.FOOD_RACCP, 10)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 25)
    target:addMod(invaderXim.mod.FOOD_DEFP, 13)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 180)
    target:addMod(invaderXim.mod.SLEEPRES, 5)
    target:addMod(invaderXim.mod.HPHEAL, 6)
    target:addMod(invaderXim.mod.MPHEAL, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.VIT, 3)
    target:delMod(invaderXim.mod.AGI, 4)
    target:delMod(invaderXim.mod.FOOD_RACCP, 10)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 25)
    target:delMod(invaderXim.mod.FOOD_DEFP, 13)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 180)
    target:delMod(invaderXim.mod.SLEEPRES, 5)
    target:delMod(invaderXim.mod.HPHEAL, 6)
    target:delMod(invaderXim.mod.MPHEAL, 3)
end

return itemObject
