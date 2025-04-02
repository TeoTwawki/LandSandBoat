-----------------------------------
-- invaderXim.effect.YONIN
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect) -- power = 30 initially
    target:addMod(invaderXim.mod.ACC, -effect:getPower())
    target:addMod(invaderXim.mod.NINJA_TOOL, effect:getPower())
    target:addMod(invaderXim.mod.ENMITY, effect:getPower())

    local yoninMerits = target:getMerit(invaderXim.merit.YONIN_EFFECT)
    if yoninMerits ~= 0 then
        target:addMod(invaderXim.mod.HP, yoninMerits)
    end

    local jpValue = target:getJobPointLevel(invaderXim.jp.YONIN_EFFECT)
    target:addMod(invaderXim.mod.EVA, 2 * jpValue)
end

effectObject.onEffectTick = function(target, effect)
    --tick down the effect and reduce the overall power
    effect:setPower(effect:getPower() - 1)
    target:delMod(invaderXim.mod.ACC, -1)
    target:delMod(invaderXim.mod.NINJA_TOOL, 1)
    target:delMod(invaderXim.mod.ENMITY, 1)
end

effectObject.onEffectLose = function(target, effect)
    --remove the remaining power
    target:delMod(invaderXim.mod.ACC, -effect:getPower())
    target:delMod(invaderXim.mod.NINJA_TOOL, effect:getPower())
    target:delMod(invaderXim.mod.ENMITY, effect:getPower())

    local yoninMerits = target:getMerit(invaderXim.merit.YONIN_EFFECT)
    if yoninMerits ~= 0 then
        target:delMod(invaderXim.mod.HP, yoninMerits)
    end

    local jpValue = target:getJobPointLevel(invaderXim.jp.YONIN_EFFECT)
    target:delMod(invaderXim.mod.EVA, 2 * jpValue)
end

return effectObject
