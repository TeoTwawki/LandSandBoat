-----------------------------------
-- invaderXim.effect.ARCANE_CREST
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local power = -effect:getPower()

    effect:addMod(invaderXim.mod.ACC, power)
    effect:addMod(invaderXim.mod.EVA, power)
    effect:addMod(invaderXim.mod.MACC, power)
    effect:addMod(invaderXim.mod.MEVA, power)
    effect:addMod(invaderXim.mod.STORETP, power)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
