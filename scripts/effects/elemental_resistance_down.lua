-----------------------------------
-- invaderXim.effect.ELEMENTAL_RESISTANCE_DOWN
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FIRE_MEVA, -effect:getPower())
    target:addMod(invaderXim.mod.ICE_MEVA, -effect:getPower())
    target:addMod(invaderXim.mod.WIND_MEVA, -effect:getPower())
    target:addMod(invaderXim.mod.EARTH_MEVA, -effect:getPower())
    target:addMod(invaderXim.mod.THUNDER_MEVA, -effect:getPower())
    target:addMod(invaderXim.mod.WATER_MEVA, -effect:getPower())
    target:addMod(invaderXim.mod.LIGHT_MEVA, -effect:getPower())
    target:addMod(invaderXim.mod.DARK_MEVA, -effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FIRE_MEVA, -effect:getPower())
    target:delMod(invaderXim.mod.ICE_MEVA, -effect:getPower())
    target:delMod(invaderXim.mod.WIND_MEVA, -effect:getPower())
    target:delMod(invaderXim.mod.EARTH_MEVA, -effect:getPower())
    target:delMod(invaderXim.mod.THUNDER_MEVA, -effect:getPower())
    target:delMod(invaderXim.mod.WATER_MEVA, -effect:getPower())
    target:delMod(invaderXim.mod.LIGHT_MEVA, -effect:getPower())
    target:delMod(invaderXim.mod.DARK_MEVA, -effect:getPower())
end

return effectObject
