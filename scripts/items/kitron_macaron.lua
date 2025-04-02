-----------------------------------
-- ID: 5781
-- Item: kitron_macaron
-- Food Effect: 30Min, All Races
-----------------------------------
-- Increases rate of synthesis success +7%
-- Increases synthesis skill gain rate +7%
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5781)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.SYNTH_SUCCESS_RATE, 7)
    target:addMod(invaderXim.mod.SYNTH_SKILL_GAIN, 7)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.SYNTH_SUCCESS_RATE, 7)
    target:delMod(invaderXim.mod.SYNTH_SKILL_GAIN, 7)
end

return itemObject
