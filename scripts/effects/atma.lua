-----------------------------------
-- invaderXim.effect.ATMA
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    invaderXim.atma.onEffectGain(target, effect)
end

effectObject.onEffectTick = function(target, effect)
    if not invaderXim.abyssea.isInAbysseaZone(target) then
        target:delStatusEffect(effect:getEffectType())
    end
end

effectObject.onEffectLose = function(target, effect)
    invaderXim.atma.onEffectLose(target, effect)
end

return effectObject
