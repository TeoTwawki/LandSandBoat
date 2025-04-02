-----------------------------------
-- invaderXim.effect.ACCURACY_DOWN
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.ACC, -effect:getPower())
    target:addMod(invaderXim.mod.RACC, -effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
    -- the effect restore accuracy of 1 every 3 ticks.
    local downACCEffectSize = effect:getPower()
    if downACCEffectSize > 0 then
        effect:setPower(downACCEffectSize - 1)
        target:delMod(invaderXim.mod.ACC, -1)
        target:delMod(invaderXim.mod.RACC, -1)
    end
end

effectObject.onEffectLose = function(target, effect)
    local downACCEffectSize = effect:getPower()
    if downACCEffectSize > 0 then
        target:delMod(invaderXim.mod.ACC, -effect:getPower())
        target:delMod(invaderXim.mod.RACC, -effect:getPower())
    end
end

return effectObject
