-----------------------------------
-- invaderXim.effect.PARALYSIS
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    effect:addMod(invaderXim.mod.PARALYZE, effect:getPower())

    -- Immunobreak reset.
    target:setMod(invaderXim.mod.PARALYZE_IMMUNOBREAK, 0)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
