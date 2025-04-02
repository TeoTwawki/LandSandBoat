-----------------------------------
-- invaderXim.effect.SNEAK_ATTACK
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.SNEAK_ATTACK_EFFECT)
    target:addMod(invaderXim.mod.SNEAK_ATK_DEX, jpValue)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.SNEAK_ATTACK_EFFECT)
    target:delMod(invaderXim.mod.SNEAK_ATK_DEX, jpValue)
end

return effectObject
