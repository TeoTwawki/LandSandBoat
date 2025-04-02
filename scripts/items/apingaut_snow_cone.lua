-----------------------------------
-- ID: 6224
-- Item: Apingaut snow cone
-- Food Effect: 30 Min, All Races
-----------------------------------
-- MP +25% (cap 105)
-- INT +6
-- MND +6
-- Magic Atk. Bonus +14
-- Lizard Killer +6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 6224)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 25)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 105)
    target:addMod(invaderXim.mod.INT, 6)
    target:addMod(invaderXim.mod.MND, 6)
    target:addMod(invaderXim.mod.MATT, 14)
    target:addMod(invaderXim.mod.LIZARD_KILLER, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 25)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 105)
    target:delMod(invaderXim.mod.INT, 6)
    target:delMod(invaderXim.mod.MND, 6)
    target:delMod(invaderXim.mod.MATT, 14)
    target:delMod(invaderXim.mod.LIZARD_KILLER, 6)
end

return itemObject
