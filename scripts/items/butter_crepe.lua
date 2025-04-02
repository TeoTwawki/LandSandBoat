-----------------------------------
-- ID: 5766
-- Item: Butter Crepe
-- Food Effect: 30 Min, All Races
-----------------------------------
-- HP +10% (cap 10)
-- Magic Accuracy +20% (cap 25)
-- Magic Defense +1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5766)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 10)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 10)
    target:addMod(invaderXim.mod.MDEF, 1)
    target:addMod(invaderXim.mod.FOOD_MACCP, 20)
    target:addMod(invaderXim.mod.FOOD_MACC_CAP, 25)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 10)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 10)
    target:delMod(invaderXim.mod.MDEF, 1)
    target:delMod(invaderXim.mod.FOOD_MACCP, 20)
    target:delMod(invaderXim.mod.FOOD_MACC_CAP, 25)
end

return itemObject
