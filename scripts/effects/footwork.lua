-----------------------------------
-- invaderXim.effect.FOOTWORK
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpLevel = target:getJobPointLevel(invaderXim.jp.FOOTWORK_EFFECT)

    target:addMod(invaderXim.mod.KICK_ATTACK_RATE, 20)
    target:addMod(invaderXim.mod.KICK_DMG, effect:getPower() + jpLevel)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpLevel = target:getJobPointLevel(invaderXim.jp.FOOTWORK_EFFECT)

    target:delMod(invaderXim.mod.KICK_ATTACK_RATE, 20)
    target:delMod(invaderXim.mod.KICK_DMG, effect:getPower() + jpLevel)
end

return effectObject
