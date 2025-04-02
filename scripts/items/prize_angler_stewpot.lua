-----------------------------------
-- ID: 5613
-- Item: Prized Angler's Stewpot
-- Food Effect: 4 Hrs, All Races
-----------------------------------
-- TODO: Group Effect
-- HP +10% (cap 200)
-- MP +20
-- Dexterity 4
-- Agility 2
-- Mind 2
-- HP Recovered while healing 9
-- MP Recovered while healing 3
-- Accuracy 15% Cap 45
-- Ranged Accuracy 15% Cap 45
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5613)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 10)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 200)
    target:addMod(invaderXim.mod.FOOD_MP, 20)
    target:addMod(invaderXim.mod.DEX, 4)
    target:addMod(invaderXim.mod.AGI, 2)
    target:addMod(invaderXim.mod.MND, 2)
    target:addMod(invaderXim.mod.HPHEAL, 9)
    target:addMod(invaderXim.mod.MPHEAL, 3)
    target:addMod(invaderXim.mod.FOOD_ACCP, 15)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 45)
    target:addMod(invaderXim.mod.FOOD_RACCP, 15)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 45)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 10)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 200)
    target:delMod(invaderXim.mod.FOOD_MP, 20)
    target:delMod(invaderXim.mod.DEX, 4)
    target:delMod(invaderXim.mod.AGI, 2)
    target:delMod(invaderXim.mod.MND, 2)
    target:delMod(invaderXim.mod.HPHEAL, 9)
    target:delMod(invaderXim.mod.MPHEAL, 3)
    target:delMod(invaderXim.mod.FOOD_ACCP, 15)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 45)
    target:delMod(invaderXim.mod.FOOD_RACCP, 15)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 45)
end

return itemObject
