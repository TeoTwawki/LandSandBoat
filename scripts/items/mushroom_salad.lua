-----------------------------------
-- ID: 5678
-- Item: Mushroom Salad
-- Food Effect: 3 Hrs, All Races
-----------------------------------
-- MP 14% Cap 85
-- Agility 6
-- Mind 6
-- Strength -5
-- Vitality -5
-- Ranged Accuracy +15
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5678)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 14)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 85)
    target:addMod(invaderXim.mod.AGI, 6)
    target:addMod(invaderXim.mod.MND, 6)
    target:addMod(invaderXim.mod.STR, -5)
    target:addMod(invaderXim.mod.VIT, -5)
    target:addMod(invaderXim.mod.RACC, 15)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 14)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 85)
    target:delMod(invaderXim.mod.AGI, 6)
    target:delMod(invaderXim.mod.MND, 6)
    target:delMod(invaderXim.mod.STR, -5)
    target:delMod(invaderXim.mod.VIT, -5)
    target:delMod(invaderXim.mod.RACC, 15)
end

return itemObject
