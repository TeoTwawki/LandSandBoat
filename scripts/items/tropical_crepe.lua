-----------------------------------
-- ID: 6567
-- Item: Tropical Crepe
-- Food Effect: 30 minutes, all Races
-----------------------------------
-- INT +2
-- MND +2
-- Magic Accuracy +20% (Max. 90)
-- "Magic Def. Bonus" +1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 6567)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.INT, 2)
    target:addMod(invaderXim.mod.MND, 2)
    target:addMod(invaderXim.mod.FOOD_MACCP, 20)
    target:addMod(invaderXim.mod.FOOD_MACC_CAP, 90)
    target:addMod(invaderXim.mod.MDEF, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.INT, 2)
    target:delMod(invaderXim.mod.MND, 2)
    target:delMod(invaderXim.mod.FOOD_MACCP, 20)
    target:delMod(invaderXim.mod.FOOD_MACC_CAP, 90)
    target:delMod(invaderXim.mod.MDEF, 1)
end

return itemObject
