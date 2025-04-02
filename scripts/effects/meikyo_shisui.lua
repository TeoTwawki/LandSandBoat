-----------------------------------
-- invaderXim.effect.MEIKYO_SHISUI
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.MEIKYO_SHISUI_EFFECT)

    target:addMod(invaderXim.mod.SKILLCHAINDMG, 200 * jpValue) -- Base 10000 mod
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.MEIKYO_SHISUI_EFFECT)

    target:delMod(invaderXim.mod.SKILLCHAINDMG, 200 * jpValue) -- Base 10000 mod
end

return effectObject
