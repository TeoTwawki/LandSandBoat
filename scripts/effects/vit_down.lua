-----------------------------------
-- invaderXim.effect.VIT_DOWN
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    if (target:getStat(invaderXim.mod.VIT) - effect:getPower()) < 0 then
        effect:setPower(target:getStat(invaderXim.mod.VIT))
    end

    target:addMod(invaderXim.mod.VIT, -effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
    -- the effect restore vitality of 1 every 3 ticks.
    local downVITEffectSize = effect:getPower()
    if downVITEffectSize > 0 then
        effect:setPower(downVITEffectSize - 1)
        target:delMod(invaderXim.mod.VIT, -1)
    end
end

effectObject.onEffectLose = function(target, effect)
    local downVITEffectSize = effect:getPower()
    if downVITEffectSize > 0 then
        target:delMod(invaderXim.mod.VIT, -downVITEffectSize)
    end
end

return effectObject
