-----------------------------------
-- invaderXim.effect.PROWESS
-- Enhanced magic acc. and magic atk
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.MATT, effect:getPower())
    target:addMod(invaderXim.mod.MACC, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.MATT, effect:getPower())
    target:delMod(invaderXim.mod.MACC, effect:getPower())
end

return effectObject
