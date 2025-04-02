-----------------------------------
-- ID: 5619
-- Item: Bowl of Zesti Zoni
-- Food Effect: 4 Hrs, All Races
-----------------------------------
-- HP 12
-- MP 12
-- Strength 2
-- Dexterity 2
-- Vitality 2
-- Agility 2
-- Accuracy +2
-- Ranged Accuracy +2
-- Attack +2
-- Ranged Attack +2
-- Evasion +2
-- MP Recovered while healing 1
-- HP Recovered while healing 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5619)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 12)
    target:addMod(invaderXim.mod.FOOD_MP, 12)
    target:addMod(invaderXim.mod.STR, 2)
    target:addMod(invaderXim.mod.DEX, 2)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.AGI, 2)
    target:addMod(invaderXim.mod.ACC, 2)
    target:addMod(invaderXim.mod.RACC, 2)
    target:addMod(invaderXim.mod.ATT, 2)
    target:addMod(invaderXim.mod.RATT, 2)
    target:addMod(invaderXim.mod.EVA, 2)
    target:addMod(invaderXim.mod.HPHEAL, 1)
    target:addMod(invaderXim.mod.MPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 12)
    target:delMod(invaderXim.mod.FOOD_MP, 12)
    target:delMod(invaderXim.mod.STR, 2)
    target:delMod(invaderXim.mod.DEX, 2)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.AGI, 2)
    target:delMod(invaderXim.mod.ACC, 2)
    target:delMod(invaderXim.mod.RACC, 2)
    target:delMod(invaderXim.mod.ATT, 2)
    target:delMod(invaderXim.mod.RATT, 2)
    target:delMod(invaderXim.mod.EVA, 2)
    target:delMod(invaderXim.mod.HPHEAL, 1)
    target:delMod(invaderXim.mod.MPHEAL, 1)
end

return itemObject
