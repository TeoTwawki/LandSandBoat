-----------------------------------
-- ID: 5783
-- Item: chocolate_rusk
-- Food Effect: 30 Min, All Races
-----------------------------------
-- High-quality success rate +2
-- Synthesis failure rate -4%
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5783)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.SYNTH_HQ_RATE, 2)
    target:addMod(invaderXim.mod.SYNTH_MATERIAL_LOSS, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.SYNTH_HQ_RATE, 2)
    target:delMod(invaderXim.mod.SYNTH_MATERIAL_LOSS, 4)
end

return itemObject
