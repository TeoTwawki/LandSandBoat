-----------------------------------
-- invaderXim.effect.MARCH
-- getPower returns the TIER (e.g. 1, 2, 3, 4)
-- DO NOT ALTER ANY OF THE EFFECT VALUES! DO NOT ALTER EFFECT POWER!
-- Todo: Find a better way of doing this. Need to account for varying modifiers + CASTER's skill (not target)
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.HASTE_MAGIC, effect:getPower())
    target:addMod(invaderXim.mod.DEX, effect:getSubPower()) -- Apply Stat Buff from AUGMENT_SONG_STAT
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.HASTE_MAGIC, effect:getPower())
    target:delMod(invaderXim.mod.DEX, effect:getSubPower()) -- Remove Stat Buff from AUGMENT_SONG_STAT
end

return effectObject
