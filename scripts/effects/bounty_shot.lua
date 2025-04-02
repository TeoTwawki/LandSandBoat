-----------------------------------
-- invaderXim.effect.BOUNTY_SHOT
-- https://www.bg-wiki.com/ffxi/Bounty_Shot
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.TREASURE_HUNTER, 2)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.TREASURE_HUNTER, 2)
end

return effectObject
