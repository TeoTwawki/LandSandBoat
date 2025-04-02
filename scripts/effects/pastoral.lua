-----------------------------------
-- invaderXim.effect.PASTORAL
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.POISONRES, effect:getPower())
    target:addMod(invaderXim.mod.DEX, effect:getSubPower()) -- Apply Stat Buff from AUGMENT_SONG_STAT
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.POISONRES, effect:getPower())
    target:delMod(invaderXim.mod.DEX, effect:getSubPower()) -- Remove Stat Buff from AUGMENT_SONG_STAT
end

return effectObject
