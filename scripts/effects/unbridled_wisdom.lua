-----------------------------------
-- invaderXim.effect.UNBRIDLED_WISDOM
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.UNBRIDLED_WISDOM_EFFECT)

    target:addMod(invaderXim.mod.CONSERVE_MP, jpValue * 3)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.UNBRIDLED_WISDOM_EFFECT)

    target:delMod(invaderXim.mod.CONSERVE_MP, jpValue * 3)
end

return effectObject
