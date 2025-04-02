-----------------------------------
-- invaderXim.effect.VELOCITY_SHOT
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.VELOCITY_SHOT_EFFECT)

    effect:addMod(invaderXim.mod.RATT, jpValue * 2)
    effect:addMod(invaderXim.mod.ATTP, -15)
    effect:addMod(invaderXim.mod.HASTE_ABILITY, -1500)
    effect:addMod(invaderXim.mod.RATTP, 15)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
