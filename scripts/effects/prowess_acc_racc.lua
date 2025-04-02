-----------------------------------
-- invaderXim.effect.PROWESS
-- Enhanced accuracy and ranged accuracy
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
-- This might not be % in retail. If not a % just change ACCP to just ACC
    target:addMod(invaderXim.mod.ACC, effect:getPower())
    target:addMod(invaderXim.mod.RACC, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.ACC, effect:getPower())
    target:delMod(invaderXim.mod.RACC, effect:getPower())
end

return effectObject
