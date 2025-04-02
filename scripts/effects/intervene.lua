-----------------------------------
-- invaderXim.effect.INTERVENE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local prevATT = target:getStat(invaderXim.mod.ATT)
    local prevACC = target:getACC()

    effect:setPower(prevATT)
    effect:setSubPower(prevACC)

    target:delMod(invaderXim.mod.ATT, prevATT)
    target:delMod(invaderXim.mod.ACC, prevACC)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local prevATT = effect:getPower()
    local prevACC = effect:getSubPower()

    target:addMod(invaderXim.mod.ATT, prevATT)
    target:addMod(invaderXim.mod.ACC, prevACC)
end

return effectObject
