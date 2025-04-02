-----------------------------------
-- invaderXim.effect.ENLIGHT
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.ENLIGHT_EFFECT)

    target:addMod(invaderXim.mod.ENSPELL, invaderXim.element.LIGHT)
    target:addMod(invaderXim.mod.ENSPELL_DMG, effect:getPower() + jpValue)
    target:addMod(invaderXim.mod.ACC, jpValue)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.ENLIGHT_EFFECT)

    target:setMod(invaderXim.mod.ENSPELL_DMG, 0)
    target:setMod(invaderXim.mod.ENSPELL, 0)
    target:delMod(invaderXim.mod.ACC, jpValue)
end

return effectObject
