-----------------------------------
-- invaderXim.effect.BOLSTER
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    invaderXim.job_utils.geomancer.bolsterOnEffectGain(target, effect)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    invaderXim.job_utils.geomancer.bolsterOnEffectLose(target, effect)
end

return effectObject
