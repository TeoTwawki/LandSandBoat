-----------------------------------
-- invaderXim.effect.FULL_SPEED_AHEAD
-- Helper for quest: Full Speed Ahead!
-----------------------------------
require('scripts/quests/full_speed_ahead')
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    invaderXim.fsa.onEffectGain(target, effect)
end

effectObject.onEffectTick = function(target, effect)
    invaderXim.fsa.tick(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    invaderXim.fsa.onEffectLose(target, effect)
end

return effectObject
