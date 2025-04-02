-----------------------------------
-- ID: 5595
-- Item: Bowl of Nashmau Stew
-- Food Effect: 4 Hrs, All Races
-----------------------------------
-- TODO: Group Effect
-- MP -100
-- Vitality -10
-- Agility -10
-- Intelligence -10
-- Mind -10
-- Charisma -10
-- Accuracy +15% Cap 25
-- Attack +18% Cap 60
-- Defense -100
-- Evasion -100
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5595)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, -100)
    target:addMod(invaderXim.mod.VIT, -10)
    target:addMod(invaderXim.mod.AGI, -10)
    target:addMod(invaderXim.mod.INT, -10)
    target:addMod(invaderXim.mod.MND, -10)
    target:addMod(invaderXim.mod.CHR, -10)
    target:addMod(invaderXim.mod.FOOD_ACCP, 15)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 25)
    target:addMod(invaderXim.mod.FOOD_ATTP, 18)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 60)
    target:addMod(invaderXim.mod.DEF, -100)
    target:addMod(invaderXim.mod.EVA, -100)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, -100)
    target:delMod(invaderXim.mod.VIT, -10)
    target:delMod(invaderXim.mod.AGI, -10)
    target:delMod(invaderXim.mod.INT, -10)
    target:delMod(invaderXim.mod.MND, -10)
    target:delMod(invaderXim.mod.CHR, -10)
    target:delMod(invaderXim.mod.FOOD_ACCP, 15)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 25)
    target:delMod(invaderXim.mod.FOOD_ATTP, 18)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 60)
    target:delMod(invaderXim.mod.DEF, -100)
    target:delMod(invaderXim.mod.EVA, -100)
end

return itemObject
