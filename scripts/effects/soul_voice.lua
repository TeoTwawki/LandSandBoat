-----------------------------------
-- invaderXim.effect.SOUL_VOICE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.SOUL_VOICE_EFFECT)

    target:addMod(invaderXim.mod.SONG_SPELLCASTING_TIME, 2 * jpValue)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.SOUL_VOICE_EFFECT)

    target:delMod(invaderXim.mod.SONG_SPELLCASTING_TIME, 2 * jpValue)
end

return effectObject
