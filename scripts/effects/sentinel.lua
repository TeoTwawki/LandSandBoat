-----------------------------------
-- invaderXim.effect.SENTINEL
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local enmityBonus = 100

    if target:getMainJob() ~= invaderXim.job.PLD then
        enmityBonus = 50
    end

    target:addMod(invaderXim.mod.UDMGPHYS, -effect:getPower())
    target:addMod(invaderXim.mod.ENMITY, enmityBonus)
    target:addMod(invaderXim.mod.ENMITY_LOSS_REDUCTION, effect:getSubPower())
end

effectObject.onEffectTick = function(target, effect)
    local power = effect:getPower()
    local decayby = 0

    -- Damage reduction decays until 50% then stops
    if power > 5000 then
        -- final tick with feet just has to be odd.
        if power == 5500 then
            decayby = 500
            -- decay by 8% per tick
        else
            decayby = 800
        end

        effect:setPower(power - decayby)
        target:delMod(invaderXim.mod.UDMGPHYS, -decayby)
    end
end

effectObject.onEffectLose = function(target, effect)
    local enmityBonus = 100

    if target:getMainJob() ~= invaderXim.job.PLD then
        enmityBonus = 50
    end

    target:delMod(invaderXim.mod.UDMGPHYS, -effect:getPower())
    target:delMod(invaderXim.mod.ENMITY, enmityBonus)
    target:delMod(invaderXim.mod.ENMITY_LOSS_REDUCTION, effect:getSubPower())
end

return effectObject
