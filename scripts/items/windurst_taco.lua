-----------------------------------
-- ID: 5172
-- Item: windurst_taco
-- Food Effect: 30Min, All Races
-----------------------------------
-- MP 20
-- Vitality -1
-- Agility 5
-- MP Recovered While Healing 1
-- Ranged Accuracy % 8 (cap 10)
-- Ranged Attack +1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5172)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 20)
    target:addMod(invaderXim.mod.VIT, -1)
    target:addMod(invaderXim.mod.AGI, 5)
    target:addMod(invaderXim.mod.MPHEAL, 1)
    target:addMod(invaderXim.mod.RATT, 1)
    target:addMod(invaderXim.mod.FOOD_RACCP, 8)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 20)
    target:delMod(invaderXim.mod.VIT, -1)
    target:delMod(invaderXim.mod.AGI, 5)
    target:delMod(invaderXim.mod.MPHEAL, 1)
    target:delMod(invaderXim.mod.RATT, 1)
    target:delMod(invaderXim.mod.FOOD_RACCP, 8)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 10)
end

return itemObject
