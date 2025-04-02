-----------------------------------
-- ID: 5171
-- Item: emerald_quiche
-- Food Effect: 60Min, All Races
-----------------------------------
-- Magic 15
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
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5171)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 15)
    target:addMod(invaderXim.mod.AGI, 1)
    target:addMod(invaderXim.mod.FOOD_RACCP, 7)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 20)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 15)
    target:delMod(invaderXim.mod.AGI, 1)
    target:delMod(invaderXim.mod.FOOD_RACCP, 7)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 20)
end

return itemObject
