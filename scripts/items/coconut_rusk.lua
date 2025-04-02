-----------------------------------
-- ID: 5784
-- Item: coconut_rusk
-- Food Effect: 30 Min, All Races
-----------------------------------
-- High-quality success rate +3
-- Synthesis failure rate -6%
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5784)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.SYNTH_HQ_RATE, 3)
    target:addMod(invaderXim.mod.SYNTH_MATERIAL_LOSS, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.SYNTH_HQ_RATE, 3)
    target:delMod(invaderXim.mod.SYNTH_MATERIAL_LOSS, 6)
end

return itemObject
