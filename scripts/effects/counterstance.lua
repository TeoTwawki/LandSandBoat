-----------------------------------
-- invaderXim.effect..COUNTERSTANCE
-- DEF is removed in core as equip swaps can mess this up otherwise!
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.COUNTER, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.COUNTER, effect:getPower())
end

return effectObject
