-----------------------------------
-- ID: 6223
-- Item: Cehuetzi snow cone
-- Food Effect: 30 Min, All Races
-----------------------------------
-- MP +20% (cap 100)
-- INT +5
-- MND +5
-- Magic Atk. Bonus +13
-- Lizard Killer +5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 6223)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 20)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 100)
    target:addMod(invaderXim.mod.INT, 5)
    target:addMod(invaderXim.mod.MND, 5)
    target:addMod(invaderXim.mod.MATT, 13)
    target:addMod(invaderXim.mod.LIZARD_KILLER, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 20)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 100)
    target:delMod(invaderXim.mod.INT, 5)
    target:delMod(invaderXim.mod.MND, 5)
    target:delMod(invaderXim.mod.MATT, 13)
    target:delMod(invaderXim.mod.LIZARD_KILLER, 5)
end

return itemObject
