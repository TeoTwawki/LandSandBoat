-----------------------------------
-- ID: 6225
-- Item: Cyclical coalescence
-- Food Effect: 30 Min, All Races
-----------------------------------
-- MP +30% (cap 110)
-- INT +7
-- MND +7
-- Magic Atk. Bonus +15
-- Lizard Killer +7
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 6225)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 30)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 110)
    target:addMod(invaderXim.mod.INT, 7)
    target:addMod(invaderXim.mod.MND, 7)
    target:addMod(invaderXim.mod.MATT, 15)
    target:addMod(invaderXim.mod.LIZARD_KILLER, 7)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 30)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 110)
    target:delMod(invaderXim.mod.INT, 7)
    target:delMod(invaderXim.mod.MND, 7)
    target:delMod(invaderXim.mod.MATT, 15)
    target:delMod(invaderXim.mod.LIZARD_KILLER, 7)
end

return itemObject
