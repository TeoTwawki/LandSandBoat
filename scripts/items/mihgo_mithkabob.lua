-----------------------------------
-- ID: 5708
-- Item: Mihgo Mithkabob
-- Food Effect: 4 Hrs, All Races
-----------------------------------
-- Dexterity 5
-- Vitality 2
-- Mind -2
-- Accuracy +50
-- Ranged Accuracy +50
-- Evasion +5
-- Defense % 25 (cap 95)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5708)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 5)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.MND, -2)
    target:addMod(invaderXim.mod.ACC, 50)
    target:addMod(invaderXim.mod.RACC, 50)
    target:addMod(invaderXim.mod.EVA, 5)
    target:addMod(invaderXim.mod.FOOD_DEFP, 25)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 95)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 5)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.MND, -2)
    target:delMod(invaderXim.mod.ACC, 50)
    target:delMod(invaderXim.mod.RACC, 50)
    target:delMod(invaderXim.mod.EVA, 5)
    target:delMod(invaderXim.mod.FOOD_DEFP, 25)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 95)
end

return itemObject
