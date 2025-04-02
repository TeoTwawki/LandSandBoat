-----------------------------------
-- invaderXim.effect.SHARPSHOT
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.SHARPSHOT_EFFECT)

    target:addMod(invaderXim.mod.RACC, effect:getPower())
    target:addMod(invaderXim.mod.RATT, jpValue * 2)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.SHARPSHOT_EFFECT)

    target:delMod(invaderXim.mod.RACC, effect:getPower())
    target:delMod(invaderXim.mod.RATT, jpValue * 2)
end

return effectObject
