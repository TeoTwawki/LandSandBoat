-----------------------------------
-- ID: 5168
-- Item: Bataquiche
-- Food Effect: 30Min, All Races
-----------------------------------
-- Magic 8
-- Agility 1
-- Vitality -2
-- Ranged Acc % 7
-- Ranged Acc Cap 15
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5168)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 8)
    target:addMod(invaderXim.mod.AGI, 1)
    target:addMod(invaderXim.mod.VIT, -2)
    target:addMod(invaderXim.mod.FOOD_RACCP, 7)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 15)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 8)
    target:delMod(invaderXim.mod.AGI, 1)
    target:delMod(invaderXim.mod.VIT, -2)
    target:delMod(invaderXim.mod.FOOD_RACCP, 7)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 15)
end

return itemObject
