-----------------------------------
-- ID: 4321
-- Item: timbre_timbers_salad
-- Food Effect: 240Min, All Races
-----------------------------------
-- Magic 20
-- Agility 5
-- Vitality -1
-- Ranged ACC % 8
-- Ranged ACC Cap 15
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 4321)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 20)
    target:addMod(invaderXim.mod.AGI, 5)
    target:addMod(invaderXim.mod.VIT, -1)
    target:addMod(invaderXim.mod.FOOD_RACCP, 8)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 15)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 20)
    target:delMod(invaderXim.mod.AGI, 5)
    target:delMod(invaderXim.mod.VIT, -1)
    target:delMod(invaderXim.mod.FOOD_RACCP, 8)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 15)
end

return itemObject
