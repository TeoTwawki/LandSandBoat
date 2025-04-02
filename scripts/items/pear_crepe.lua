-----------------------------------
-- ID: 5777
-- Item: Pear Crepe
-- Food Effect: 30 Min, All Races
-----------------------------------
-- Intelligence +2
-- MP Healing +2
-- Magic Accuracy +20% (cap 45)
-- Magic Defense +1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5777)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.INT, 2)
    target:addMod(invaderXim.mod.FOOD_MACCP, 20)
    target:addMod(invaderXim.mod.FOOD_MACC_CAP, 45)
    target:addMod(invaderXim.mod.MDEF, 1)
    target:addMod(invaderXim.mod.MPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.INT, 2)
    target:delMod(invaderXim.mod.FOOD_MACCP, 20)
    target:delMod(invaderXim.mod.FOOD_MACC_CAP, 45)
    target:delMod(invaderXim.mod.MDEF, 1)
    target:delMod(invaderXim.mod.MPHEAL, 2)
end

return itemObject
