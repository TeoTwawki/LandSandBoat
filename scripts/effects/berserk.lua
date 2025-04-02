-----------------------------------
-- invaderXim.effect.BERSERK
-----------------------------------
---@type TEffect
local effectObject = {}

-- DEFP penalty reduction from Warrior's Calligae NQ/+1/+2 handled by latent effect
-- CRITHITRATE & DOUBLE_ATTACK bonuses from Conqueror (all forms) handled by latent effect
effectObject.onEffectGain = function(target, effect)
    local power = effect:getPower()
    local jpLevel = target:getJobPointLevel(invaderXim.jp.BERSERK_EFFECT)
    local jpEffect = jpLevel * 2

    target:addMod(invaderXim.mod.ATTP, power)
    target:addMod(invaderXim.mod.RATTP, power)
    target:addMod(invaderXim.mod.DEFP, -power)

    -- Job Point Bonuses
    target:addMod(invaderXim.mod.ATT, jpEffect)
    target:addMod(invaderXim.mod.RATT, jpEffect)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local power = effect:getPower()
    local jpLevel = target:getJobPointLevel(invaderXim.jp.BERSERK_EFFECT)
    local jpEffect = jpLevel * 2

    target:delMod(invaderXim.mod.ATTP, power)
    target:delMod(invaderXim.mod.RATTP, power)
    target:delMod(invaderXim.mod.DEFP, -power)

    -- Job Point Bonuses
    target:delMod(invaderXim.mod.ATT, jpEffect)
    target:delMod(invaderXim.mod.RATT, jpEffect)
end

return effectObject
