-----------------------------------
-- ID: 4293
-- Item: serving_of_monastic_sautee
-- Food Effect: 240Min, All Races
-----------------------------------
-- Agility 1
-- Ranged ACC % 7
-- Ranged ACC Cap 20
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 4293)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AGI, 1)
    target:addMod(invaderXim.mod.FOOD_RACCP, 7)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 20)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AGI, 1)
    target:delMod(invaderXim.mod.FOOD_RACCP, 7)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 20)
end

return itemObject
