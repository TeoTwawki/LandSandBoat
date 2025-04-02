-----------------------------------
-- invaderXim.effect.SHELL
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DMGMAGIC, -effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DMGMAGIC, -effect:getPower())
end

return effectObject
