-----------------------------------
-- invaderXim.effect.MULTI_STRIKES
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    if effect:getTier() == 2 then
        target:addMod(invaderXim.mod.TRIPLE_ATTACK, effect:getPower())
    else
        target:addMod(invaderXim.mod.DOUBLE_ATTACK, effect:getPower())
    end
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    if effect:getTier() == 2 then
        target:delMod(invaderXim.mod.TRIPLE_ATTACK, effect:getPower())
    else
        target:delMod(invaderXim.mod.DOUBLE_ATTACK, effect:getPower())
    end
end

return effectObject
