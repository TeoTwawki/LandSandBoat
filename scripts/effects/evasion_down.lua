-----------------------------------
-- invaderXim.effect.EVASION_DOWN
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local power = math.min(effect:getPower(), target:getStat(invaderXim.mod.EVA))
    effect:setPower(power)
    target:delMod(invaderXim.mod.EVA, power)
end

-- only Feint uses tick, which restores 10 evasion per tick
effectObject.onEffectTick = function(target, effect)
    local power = effect:getPower()
    local adj = math.min(power, 10)
    effect:setPower(power - adj)
    target:addMod(invaderXim.mod.EVA, adj)
end

effectObject.onEffectLose = function(target, effect)
    local power = effect:getPower()
    target:addMod(invaderXim.mod.EVA, power)
end

return effectObject
