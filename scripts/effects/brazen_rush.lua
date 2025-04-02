-----------------------------------
-- invaderXim.effect.BRAZEN_RUSH
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpLevel = target:getJobPointLevel(invaderXim.jp.BRAZEN_RUSH_EFFECT)

    target:addMod(invaderXim.mod.ATT, 4 * jpLevel)
    target:addMod(invaderXim.mod.DOUBLE_ATTACK, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
    local prevPower = effect:getPower()
    local nextPower = prevPower - 10

    target:delMod(invaderXim.mod.DOUBLE_ATTACK, prevPower)
    effect:setPower(nextPower)
    target:addMod(invaderXim.mod.DOUBLE_ATTACK, nextPower)
end

effectObject.onEffectLose = function(target, effect)
    local jpLevel = target:getJobPointLevel(invaderXim.jp.BRAZEN_RUSH_EFFECT)

    target:delMod(invaderXim.mod.ATT, 4 * jpLevel)
    target:delMod(invaderXim.mod.DOUBLE_ATTACK, effect:getPower())
end

return effectObject
