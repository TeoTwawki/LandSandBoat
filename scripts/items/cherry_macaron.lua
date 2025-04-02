-----------------------------------
-- ID: 5779
-- Item: cherry_macaron
-- Food Effect: 30Min, All Races
-----------------------------------
-- Increases rate of synthesis success +3%
-- Increases synthesis skill gain rate +3%
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5779)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.SYNTH_SUCCESS_RATE, 3)
    target:addMod(invaderXim.mod.SYNTH_SKILL_GAIN, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.SYNTH_SUCCESS_RATE, 3)
    target:delMod(invaderXim.mod.SYNTH_SKILL_GAIN, 3)
end

return itemObject
