-----------------------------------
-- ID: 5679
-- Item: cathedral_salad
-- Food Effect: 4 Hrs, All Races
-----------------------------------
-- MP 15% Cap 90
-- Agility 7
-- Mind 7
-- Strength -5
-- Vitality -5
-- Ranged Accuracy +17
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5679)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 15)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 90)
    target:addMod(invaderXim.mod.AGI, 7)
    target:addMod(invaderXim.mod.MND, 7)
    target:addMod(invaderXim.mod.STR, -5)
    target:addMod(invaderXim.mod.VIT, -5)
    target:addMod(invaderXim.mod.RACC, 17)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 15)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 90)
    target:delMod(invaderXim.mod.AGI, 7)
    target:delMod(invaderXim.mod.MND, 7)
    target:delMod(invaderXim.mod.STR, -5)
    target:delMod(invaderXim.mod.VIT, -5)
    target:delMod(invaderXim.mod.RACC, 17)
end

return itemObject
