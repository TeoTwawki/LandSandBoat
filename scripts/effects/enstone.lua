-----------------------------------
-- invaderXim.effect.ENSTONE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.ENSPELL, invaderXim.element.EARTH)
    target:addMod(invaderXim.mod.ENSPELL_DMG, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:setMod(invaderXim.mod.ENSPELL_DMG, 0)
    target:setMod(invaderXim.mod.ENSPELL, 0)
end

return effectObject
