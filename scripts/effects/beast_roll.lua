-----------------------------------
-- invaderXim.effect.BEAST_ROLL
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addPetMod(invaderXim.mod.ATTP, effect:getPower())
    target:addPetMod(invaderXim.mod.RATTP, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delPetMod(invaderXim.mod.ATTP, effect:getPower())
    target:delPetMod(invaderXim.mod.RATTP, effect:getPower())
end

return effectObject
