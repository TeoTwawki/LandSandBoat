-----------------------------------
-- ID: 5780
-- Item: coffee_macaron
-- Food Effect: 30Min, All Races
-----------------------------------
-- Increases rate of synthesis success +5%
-- Increases synthesis skill gain rate +5%
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5780)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.SYNTH_SUCCESS_RATE, 5)
    target:addMod(invaderXim.mod.SYNTH_SKILL_GAIN, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.SYNTH_SUCCESS_RATE, 5)
    target:delMod(invaderXim.mod.SYNTH_SKILL_GAIN, 5)
end

return itemObject
