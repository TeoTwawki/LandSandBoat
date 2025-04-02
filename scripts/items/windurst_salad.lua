-----------------------------------
-- ID: 4555
-- Item: windurst_salad
-- Food Effect: 180Min, All Races
-----------------------------------
-- Magic 20
-- Agility 5
-- Vitality -1
-- Ranged ACC % 8
-- Ranged ACC Cap 10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4555)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 20)
    target:addMod(invaderXim.mod.AGI, 5)
    target:addMod(invaderXim.mod.VIT, -1)
    target:addMod(invaderXim.mod.FOOD_RACCP, 8)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 20)
    target:delMod(invaderXim.mod.AGI, 5)
    target:delMod(invaderXim.mod.VIT, -1)
    target:delMod(invaderXim.mod.FOOD_RACCP, 8)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 10)
end

return itemObject
