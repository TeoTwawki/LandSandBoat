-----------------------------------
-- ID: 5240
-- Item: Prized Seafood Stewpot
-- Food Effect: 4 Hrs, All Races
-----------------------------------
-- TODO: Group Effect
-- HP +10% Cap 100
-- MP +20
-- Dexterity 2
-- Vitality 2
-- Agility 2
-- Mind 2
-- HP Recovered while healing 9
-- MP Recovered while healing 3
-- Accuracy 7
-- Ranged Accuracy 7
-- Evasion 7
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5240)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 10)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 100)
    target:addMod(invaderXim.mod.FOOD_MP, 20)
    target:addMod(invaderXim.mod.DEX, 2)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.AGI, 2)
    target:addMod(invaderXim.mod.MND, 2)
    target:addMod(invaderXim.mod.HPHEAL, 9)
    target:addMod(invaderXim.mod.MPHEAL, 3)
    target:addMod(invaderXim.mod.ACC, 7)
    target:addMod(invaderXim.mod.RACC, 7)
    target:addMod(invaderXim.mod.EVA, 7)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 10)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 100)
    target:delMod(invaderXim.mod.FOOD_MP, 20)
    target:delMod(invaderXim.mod.DEX, 2)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.AGI, 2)
    target:delMod(invaderXim.mod.MND, 2)
    target:delMod(invaderXim.mod.HPHEAL, 9)
    target:delMod(invaderXim.mod.MPHEAL, 3)
    target:delMod(invaderXim.mod.ACC, 7)
    target:delMod(invaderXim.mod.RACC, 7)
    target:delMod(invaderXim.mod.EVA, 7)
end

return itemObject
