-----------------------------------
-- ID: 5771
-- Item: ham_and_cheese_crepe
-- Food Effect: 30 Min, All Races
-----------------------------------
-- HP +10% (cap 25)
-- STR +2
-- VIT +1
-- Magic Accuracy +10
-- Magic Defense +3
-- hHP +2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5771)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 10)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 25)
    target:addMod(invaderXim.mod.STR, 2)
    target:addMod(invaderXim.mod.VIT, 1)
    target:addMod(invaderXim.mod.MACC, 10)
    target:addMod(invaderXim.mod.MDEF, 3)
    target:addMod(invaderXim.mod.HPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 10)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 25)
    target:delMod(invaderXim.mod.STR, 2)
    target:delMod(invaderXim.mod.VIT, 1)
    target:delMod(invaderXim.mod.MACC, 10)
    target:delMod(invaderXim.mod.MDEF, 3)
    target:delMod(invaderXim.mod.HPHEAL, 2)
end

return itemObject
