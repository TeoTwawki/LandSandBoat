-----------------------------------
-- ID: 4511
-- Item: Bowl of Ambrosia
-- Food Effect: 240Min, All Races
-----------------------------------
-- HP +7
-- MP +7
-- STR +7
-- DEX +7
-- VIT +7
-- AGI +7
-- INT +7
-- MND +7
-- CHR +7
-- Accuracy +7
-- Ranged Accuracy +7
-- Attack +7
-- Ranged Attack +7
-- Evasion +7
-- Defense +7
-- HP recovered while healing +7
-- MP recovered while healing +7
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 4511)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 7)
    target:addMod(invaderXim.mod.FOOD_MP, 7)
    target:addMod(invaderXim.mod.STR, 7)
    target:addMod(invaderXim.mod.DEX, 7)
    target:addMod(invaderXim.mod.VIT, 7)
    target:addMod(invaderXim.mod.AGI, 7)
    target:addMod(invaderXim.mod.INT, 7)
    target:addMod(invaderXim.mod.MND, 7)
    target:addMod(invaderXim.mod.CHR, 7)
    target:addMod(invaderXim.mod.ATT, 7)
    target:addMod(invaderXim.mod.RATT, 7)
    target:addMod(invaderXim.mod.ACC, 7)
    target:addMod(invaderXim.mod.RACC, 7)
    target:addMod(invaderXim.mod.HPHEAL, 7)
    target:addMod(invaderXim.mod.MPHEAL, 7)
    target:addMod(invaderXim.mod.DEF, 7)
    target:addMod(invaderXim.mod.EVA, 7)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 7)
    target:delMod(invaderXim.mod.FOOD_MP, 7)
    target:delMod(invaderXim.mod.STR, 7)
    target:delMod(invaderXim.mod.DEX, 7)
    target:delMod(invaderXim.mod.VIT, 7)
    target:delMod(invaderXim.mod.AGI, 7)
    target:delMod(invaderXim.mod.INT, 7)
    target:delMod(invaderXim.mod.MND, 7)
    target:delMod(invaderXim.mod.CHR, 7)
    target:delMod(invaderXim.mod.ATT, 7)
    target:delMod(invaderXim.mod.RATT, 7)
    target:delMod(invaderXim.mod.ACC, 7)
    target:delMod(invaderXim.mod.RACC, 7)
    target:delMod(invaderXim.mod.HPHEAL, 7)
    target:delMod(invaderXim.mod.MPHEAL, 7)
    target:delMod(invaderXim.mod.DEF, 7)
    target:delMod(invaderXim.mod.EVA, 7)
end

return itemObject
