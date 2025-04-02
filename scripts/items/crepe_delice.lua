-----------------------------------
-- ID: 5767
-- Item: Crepe Delice
-- Food Effect: 30 Min, All Races
-----------------------------------
-- HP +10% (cap 15)
-- Magic Accuracy +21% (cap 30)
-- Magic Defense +2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5767)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 10)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 15)
    target:addMod(invaderXim.mod.MDEF, 2)
    target:addMod(invaderXim.mod.FOOD_MACCP, 21)
    target:addMod(invaderXim.mod.FOOD_MACC_CAP, 30)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 10)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 15)
    target:delMod(invaderXim.mod.MDEF, 2)
    target:delMod(invaderXim.mod.FOOD_MACCP, 21)
    target:delMod(invaderXim.mod.FOOD_MACC_CAP, 30)
end

return itemObject
