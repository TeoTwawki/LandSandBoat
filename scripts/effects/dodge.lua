-----------------------------------
-- invaderXim.effect.DODGE
-----------------------------------
---@type TEffect
local effectObject = {}

-- TODO: implement Glanzfaust effects
effectObject.onEffectGain = function(target, effect)
    local jpLevel   = target:getJobPointLevel(invaderXim.jp.DODGE_EFFECT)
    local dodgeMod  = target:getMod(invaderXim.mod.DODGE_EFFECT)
    local monkLevel = utils.getActiveJobLevel(target, invaderXim.job.MNK)

    -- https://www.bg-wiki.com/ffxi/Dodge
    effect:addMod(invaderXim.mod.EVA, monkLevel + 1 + dodgeMod + jpLevel)
    effect:addMod(invaderXim.mod.ADDITIVE_GUARD, math.floor((monkLevel + 1) * 0.2))
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
