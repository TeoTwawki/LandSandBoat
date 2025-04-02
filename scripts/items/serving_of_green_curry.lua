-----------------------------------
-- ID: 4296
-- Item: serving_of_green_curry
-- Food Effect: 180Min, All Races
-----------------------------------
-- Agility 2
-- Vitality 1
-- Health Regen While Healing 2
-- Magic Regen While Healing 1
-- Defense +9% (cap 160)
-- Ranged ACC +5% (cap 25)
-- Sleep Resist +3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4296)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AGI, 2)
    target:addMod(invaderXim.mod.VIT, 1)
    target:addMod(invaderXim.mod.HPHEAL, 2)
    target:addMod(invaderXim.mod.MPHEAL, 1)
    target:addMod(invaderXim.mod.FOOD_DEFP, 9)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 160)
    target:addMod(invaderXim.mod.FOOD_RACCP, 5)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 25)
    target:addMod(invaderXim.mod.SLEEPRES, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AGI, 2)
    target:delMod(invaderXim.mod.VIT, 1)
    target:delMod(invaderXim.mod.HPHEAL, 2)
    target:delMod(invaderXim.mod.MPHEAL, 1)
    target:delMod(invaderXim.mod.FOOD_DEFP, 9)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 160)
    target:delMod(invaderXim.mod.FOOD_RACCP, 5)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 25)
    target:delMod(invaderXim.mod.SLEEPRES, 3)
end

return itemObject
