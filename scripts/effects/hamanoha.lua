-----------------------------------
-- invaderXim.effect.HAMANOHA
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.ACC, 20)
    target:addMod(invaderXim.mod.EVA, 20)
    target:addMod(invaderXim.mod.MACC, 20)
    target:addMod(invaderXim.mod.MEVA, 20)
    target:addMod(invaderXim.mod.REGAIN_DOWN, 20)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.ACC, 20)
    target:delMod(invaderXim.mod.EVA, 20)
    target:delMod(invaderXim.mod.MACC, 20)
    target:delMod(invaderXim.mod.MEVA, 20)
    target:delMod(invaderXim.mod.REGAIN_DOWN, 20)
end

return effectObject
