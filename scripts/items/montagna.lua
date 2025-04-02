-----------------------------------
-- ID: 5887
-- Item: montagna
-- Food Effect: 30Min, All Races
-----------------------------------
-- HP +8% (cap 140)
-- Increases rate of combat skill gains by 60%
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5887)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 8)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 140)
    target:addMod(invaderXim.mod.COMBAT_SKILLUP_RATE, 60)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 8)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 140)
    target:delMod(invaderXim.mod.COMBAT_SKILLUP_RATE, 60)
end

return itemObject
