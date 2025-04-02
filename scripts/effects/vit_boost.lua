-----------------------------------
-- invaderXim.effect.VIT_BOOST
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.VIT, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
    -- the effect loses vitality of 1 every 3 ticks depending on the source of the boost
    local boostVITEffectSize = effect:getPower()
    if boostVITEffectSize > 0 then
        effect:setPower(boostVITEffectSize - 1)
        target:delMod(invaderXim.mod.VIT, 1)
    end
end

effectObject.onEffectLose = function(target, effect)
    local boostVITEffectSize = effect:getPower()
    if boostVITEffectSize > 0 then
        target:delMod(invaderXim.mod.VIT, boostVITEffectSize)
    end
end

return effectObject
