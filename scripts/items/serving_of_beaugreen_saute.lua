-----------------------------------
-- ID: 4572
-- Item: serving_of_beaugreen_sautee
-- Food Effect: 180Min, All Races
-----------------------------------
-- Agility 1
-- Vitality -1
-- Ranged Acc % 7
-- Ranged Acc Cap 15
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4572)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AGI, 1)
    target:addMod(invaderXim.mod.VIT, -1)
    target:addMod(invaderXim.mod.FOOD_RACCP, 7)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 15)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AGI, 1)
    target:delMod(invaderXim.mod.VIT, -1)
    target:delMod(invaderXim.mod.FOOD_RACCP, 7)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 15)
end

return itemObject
