-----------------------------------
-- invaderXim.effect.FIRE_MANEUVER
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local pet = target:getPet()
    if pet then
        pet:addMod(invaderXim.mod.STR, effect:getPower())
    end
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local pet = target:getPet()
    if pet then
        pet:delMod(invaderXim.mod.STR, effect:getPower())
    end
end

return effectObject
