-----------------------------------
-- ID: 5775
-- Item: Chocolate Crepe
-- Food Effect: 30 Min, All Races
-----------------------------------
-- HP +5% (cap 15)
-- MP Healing 2
-- Magic Accuracy +20% (cap 35)
-- Magic Defense +1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5775)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 5)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 15)
    target:addMod(invaderXim.mod.MPHEAL, 2)
    target:addMod(invaderXim.mod.MDEF, 1)
    target:addMod(invaderXim.mod.FOOD_MACCP, 20)
    target:addMod(invaderXim.mod.FOOD_MACC_CAP, 35)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 5)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 15)
    target:delMod(invaderXim.mod.MPHEAL, 2)
    target:delMod(invaderXim.mod.MDEF, 1)
    target:delMod(invaderXim.mod.FOOD_MACCP, 20)
    target:delMod(invaderXim.mod.FOOD_MACC_CAP, 35)
end

return itemObject
