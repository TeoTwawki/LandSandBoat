-----------------------------------
-- invaderXim.effect.ATTACK_BOOST
--
-- getPower()       = ATTP
-- getSubPower()    = RATTP
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    if effect:getPower() > 100 then --normalize values(?)
        effect:setPower(50)
    end

    if effect:getSubPower() > 100 then --normalize values(?)
        effect:setSubPower(50)
    end

    target:addMod(invaderXim.mod.ATTP, effect:getPower())
    if effect:getSubPower() > 0 then
        target:addMod(invaderXim.mod.RATTP, effect:getSubPower())
    end
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.ATTP, effect:getPower())
    if effect:getSubPower() > 0 then
        target:delMod(invaderXim.mod.RATTP, effect:getSubPower())
    end
end

return effectObject
