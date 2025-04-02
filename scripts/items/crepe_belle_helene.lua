-----------------------------------
-- ID: 5778
-- Item: Crepe Belle Helene
-- Food Effect: 60 Min, All Races
-----------------------------------
-- Intelligence +2
-- MP Healing +3
-- Magic Accuracy +21% (cap 50)
-- Magic Defense +1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5778)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.INT, 2)
    target:addMod(invaderXim.mod.MPHEAL, 3)
    target:addMod(invaderXim.mod.FOOD_MACCP, 21)
    target:addMod(invaderXim.mod.FOOD_MACC_CAP, 50)
    target:addMod(invaderXim.mod.MDEF, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.INT, 2)
    target:delMod(invaderXim.mod.MPHEAL, 3)
    target:delMod(invaderXim.mod.FOOD_MACCP, 21)
    target:delMod(invaderXim.mod.FOOD_MACC_CAP, 50)
    target:delMod(invaderXim.mod.MDEF, 1)
end

return itemObject
