-----------------------------------
-- invaderXim.effect.INNIN
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect) -- Power = 30 initially, subpower = 20 for enmity
    local power   = effect:getPower()
    local jpValue = target:getJobPointLevel(invaderXim.jp.INNIN_EFFECT)

    target:addMod(invaderXim.mod.NIN_NUKE_BONUS_INNIN, power)
    target:addMod(invaderXim.mod.EVA, -power)
    target:addMod(invaderXim.mod.ENMITY, -effect:getSubPower())
    target:addMod(invaderXim.mod.ACC, jpValue)
end

effectObject.onEffectTick = function(target, effect)
    -- Tick down the effect and reduce the overall power.
    local power = effect:getPower()

    -- Handle decay. Minimum values are 10, at which point, decay stops.
    if power > 10 then
        power = power - 1
        effect:setPower(power)

        target:delMod(invaderXim.mod.NIN_NUKE_BONUS_INNIN, 1)
        target:delMod(invaderXim.mod.EVA, -1)

        -- Emnity decay is twice as slow. Minimal value will be 10 at the end of the day.
        if power % 2 == 0 then
            effect:setSubPower(effect:getSubPower() - 1)
            target:delMod(invaderXim.mod.ENMITY, -1)
        end
    end
end

effectObject.onEffectLose = function(target, effect)
    local power   = effect:getPower()
    local jpValue = target:getJobPointLevel(invaderXim.jp.INNIN_EFFECT)

    -- Remove the remaining modifiers.
    target:delMod(invaderXim.mod.NIN_NUKE_BONUS_INNIN, power)
    target:delMod(invaderXim.mod.EVA, -power)
    target:delMod(invaderXim.mod.ENMITY, -effect:getSubPower())
    target:delMod(invaderXim.mod.ACC, jpValue)
end

return effectObject
