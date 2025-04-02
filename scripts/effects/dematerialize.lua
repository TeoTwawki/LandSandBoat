-----------------------------------
-- invaderXim.effect.DEMATERIALIZE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.UDMGPHYS, -10000)
    target:addMod(invaderXim.mod.UDMGMAGIC, -10000)
    target:addMod(invaderXim.mod.UDMGBREATH, -10000)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.UDMGPHYS, -10000)
    target:delMod(invaderXim.mod.UDMGMAGIC, -10000)
    target:delMod(invaderXim.mod.UDMGBREATH, -10000)
end

return effectObject
