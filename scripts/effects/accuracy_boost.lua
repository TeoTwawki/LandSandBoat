-----------------------------------
-- invaderXim.effect.ACCURACY_BOOST
--
-- getPower     = ACC
-- getSubPower  = RACC
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.ACC, effect:getPower())
    if effect:getSubPower() > 0 then
        target:addMod(invaderXim.mod.RACC, effect:getSubPower())
    end
end

effectObject.onEffectTick = function(target, effect)
    -- the effect loses accuracy of 1 every 3 ticks depending on the source of the acc boost
    local boostACCEffectSize = effect:getPower()
    if boostACCEffectSize > 0 then
        effect:setPower(boostACCEffectSize - 1)
        target:delMod(invaderXim.mod.ACC, 1)
    end
end

effectObject.onEffectLose = function(target, effect)
    local boostACCEffectSize = effect:getPower()
    if boostACCEffectSize > 0 then
        target:delMod(invaderXim.mod.ACC, effect:getPower())
    end

    if effect:getSubPower() > 0 then
        target:delMod(invaderXim.mod.RACC, effect:getSubPower())
    end
end

return effectObject
