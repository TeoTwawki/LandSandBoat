-----------------------------------
-- invaderXim.effect.DEX_DOWN
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    if (target:getStat(invaderXim.mod.DEX) - effect:getPower()) < 0 then
        effect:setPower(target:getStat(invaderXim.mod.DEX))
    end

    target:addMod(invaderXim.mod.DEX, -effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
    -- the effect restore dexterity of 1 every 3 ticks.
    local downDEXEffectSize = effect:getPower()
    if downDEXEffectSize > 0 then
        effect:setPower(downDEXEffectSize - 1)
        target:delMod(invaderXim.mod.DEX, -1)
    end
end

effectObject.onEffectLose = function(target, effect)
    local downDEXEffectSize = effect:getPower()
    if downDEXEffectSize > 0 then
        target:delMod(invaderXim.mod.DEX, -downDEXEffectSize)
    end
end

return effectObject
