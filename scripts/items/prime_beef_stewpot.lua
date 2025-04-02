-----------------------------------
-- ID: 5548
-- Item: Prime Beef Stewpot
-- Food Effect: 4 Hrs, All Races
-----------------------------------
-- TODO: Group Effect
-- HP +10% Cap 75
-- MP +15
-- Strength +2
-- Agility +1
-- Mind +1
-- HP Recovered while healing +7
-- MP Recovered while healing +2
-- Attack 18% Cap 60
-- Evasion +6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5548)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 10)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 75)
    target:addMod(invaderXim.mod.FOOD_MP, 15)
    target:addMod(invaderXim.mod.STR, 2)
    target:addMod(invaderXim.mod.AGI, 1)
    target:addMod(invaderXim.mod.MND, 1)
    target:addMod(invaderXim.mod.HPHEAL, 7)
    target:addMod(invaderXim.mod.MPHEAL, 2)
    target:addMod(invaderXim.mod.FOOD_ATTP, 18)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 60)
    target:addMod(invaderXim.mod.EVA, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 10)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 75)
    target:delMod(invaderXim.mod.FOOD_MP, 15)
    target:delMod(invaderXim.mod.STR, 2)
    target:delMod(invaderXim.mod.AGI, 1)
    target:delMod(invaderXim.mod.MND, 1)
    target:delMod(invaderXim.mod.HPHEAL, 7)
    target:delMod(invaderXim.mod.MPHEAL, 2)
    target:delMod(invaderXim.mod.FOOD_ATTP, 18)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 60)
    target:delMod(invaderXim.mod.EVA, 6)
end

return itemObject
