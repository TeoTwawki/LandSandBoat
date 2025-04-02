-----------------------------------
-- ID: 5772
-- Item: crepe_paysanne
-- Food Effect: 30 Min, All Races
-----------------------------------
-- HP +10% (cap 30)
-- STR +2
-- VIT +1
-- Magic Accuracy +15
-- Magic Defense +4
-- hHP +3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5772)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 10)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 30)
    target:addMod(invaderXim.mod.STR, 2)
    target:addMod(invaderXim.mod.VIT, 1)
    target:addMod(invaderXim.mod.MACC, 15)
    target:addMod(invaderXim.mod.MDEF, 4)
    target:addMod(invaderXim.mod.HPHEAL, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 10)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 30)
    target:delMod(invaderXim.mod.STR, 2)
    target:delMod(invaderXim.mod.VIT, 1)
    target:delMod(invaderXim.mod.MACC, 15)
    target:delMod(invaderXim.mod.MDEF, 4)
    target:delMod(invaderXim.mod.HPHEAL, 3)
end

return itemObject
