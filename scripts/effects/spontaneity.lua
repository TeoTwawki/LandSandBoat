-----------------------------------
-- invaderXim.effect.SPONTANEITY
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.UFASTCAST, 150)
    effect:addEffectFlag(invaderXim.effectFlag.MAGIC_BEGIN)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.UFASTCAST, 150)
end

return effectObject
