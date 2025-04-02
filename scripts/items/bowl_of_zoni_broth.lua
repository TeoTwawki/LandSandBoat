-----------------------------------
-- ID: 5618
-- Item: bowl_of_zoni_broth
-- Food Effect: 3Hrs, All Races
-----------------------------------
-- HP 10
-- MP 10
-- Strength 1
-- Dexterity 1
-- Vitality 1
-- Agility 1
-- Accuracy +1
-- Ranged Accuracy +1
-- Attack +1
-- Ranged Attack +1
-- Evasion +1
-- HP Recovered While Healing 1
-- MP Recovered While Healing 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5618)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 10)
    target:addMod(invaderXim.mod.FOOD_MP, 10)
    target:addMod(invaderXim.mod.STR, 1)
    target:addMod(invaderXim.mod.DEX, 1)
    target:addMod(invaderXim.mod.VIT, 1)
    target:addMod(invaderXim.mod.AGI, 1)
    target:addMod(invaderXim.mod.ACC, 1)
    target:addMod(invaderXim.mod.RACC, 1)
    target:addMod(invaderXim.mod.ATT, 1)
    target:addMod(invaderXim.mod.RATT, 1)
    target:addMod(invaderXim.mod.EVA, 1)
    target:addMod(invaderXim.mod.HPHEAL, 1)
    target:addMod(invaderXim.mod.MPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 10)
    target:delMod(invaderXim.mod.FOOD_MP, 10)
    target:delMod(invaderXim.mod.STR, 1)
    target:delMod(invaderXim.mod.DEX, 1)
    target:delMod(invaderXim.mod.VIT, 1)
    target:delMod(invaderXim.mod.AGI, 1)
    target:delMod(invaderXim.mod.ACC, 1)
    target:delMod(invaderXim.mod.RACC, 1)
    target:delMod(invaderXim.mod.ATT, 1)
    target:delMod(invaderXim.mod.RATT, 1)
    target:delMod(invaderXim.mod.EVA, 1)
    target:delMod(invaderXim.mod.HPHEAL, 1)
    target:delMod(invaderXim.mod.MPHEAL, 1)
end

return itemObject
