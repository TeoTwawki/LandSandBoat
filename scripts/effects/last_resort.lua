-----------------------------------
-- invaderXim.effect.LAST_RESORT
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local targetMerit     = target:getMerit(invaderXim.merit.LAST_RESORT_EFFECT)
    local targetJobPoints = target:getJobPointLevel(invaderXim.jp.LAST_RESORT_EFFECT)

    -- Job point effect
    effect:addMod(invaderXim.mod.ATT, 2 * targetJobPoints)
    effect:addMod(invaderXim.mod.RATT, 2 * targetJobPoints)

    -- Merit effect
    effect:addMod(invaderXim.mod.ATTP, 25 + targetMerit)
    effect:addMod(invaderXim.mod.RATTP, 25 + targetMerit)
    effect:addMod(invaderXim.mod.DEFP, -25 - targetMerit)

    effect:addMod(invaderXim.mod.TWOHAND_HASTE_ABILITY, target:getMod(invaderXim.mod.DESPERATE_BLOWS) + target:getMerit(invaderXim.merit.DESPERATE_BLOWS))
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
