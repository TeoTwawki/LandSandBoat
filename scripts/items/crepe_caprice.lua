-----------------------------------
-- ID: 5776
-- Item: Crepe Caprice
-- Food Effect: 30 Min, All Races
-----------------------------------
-- HP +5% (cap20)
-- MP Healing 3
-- Magic Accuracy +21% (cap 40)
-- Magic Defense +2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5776)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 5)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 20)
    target:addMod(invaderXim.mod.MPHEAL, 3)
    target:addMod(invaderXim.mod.MDEF, 2)
    target:addMod(invaderXim.mod.FOOD_MACCP, 21)
    target:addMod(invaderXim.mod.FOOD_MACC_CAP, 40)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 5)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 20)
    target:delMod(invaderXim.mod.MPHEAL, 3)
    target:delMod(invaderXim.mod.MDEF, 2)
    target:delMod(invaderXim.mod.FOOD_MACCP, 21)
    target:delMod(invaderXim.mod.FOOD_MACC_CAP, 40)
end

return itemObject
