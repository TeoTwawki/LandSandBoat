-----------------------------------
-- invaderXim.effect.MANAWELL
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.NO_SPELL_MP_DEPLETION, 100)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.NO_SPELL_MP_DEPLETION, 100)
end

return effectObject
