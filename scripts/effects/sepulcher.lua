-----------------------------------
-- invaderXim.effect.SEPULCHER
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local power = -effect:getPower()

    target:addMod(invaderXim.mod.ACC, power)
    target:addMod(invaderXim.mod.EVA, power)
    target:addMod(invaderXim.mod.MACC, power)
    target:addMod(invaderXim.mod.MEVA, power)
    target:addMod(invaderXim.mod.STORETP, power)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local power = -effect:getPower()

    target:delMod(invaderXim.mod.ACC, power)
    target:delMod(invaderXim.mod.EVA, power)
    target:delMod(invaderXim.mod.MACC, power)
    target:delMod(invaderXim.mod.MEVA, power)
    target:delMod(invaderXim.mod.STORETP, power)
end

return effectObject
