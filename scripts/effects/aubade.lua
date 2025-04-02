-----------------------------------
-- invaderXim.effect.AUBADE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    effect:addMod(invaderXim.mod.SLEEPRES, effect:getPower())
    effect:addMod(invaderXim.mod.CHR, effect:getSubPower()) -- Apply Stat Buff from AUGMENT_SONG_STAT
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
