-----------------------------------
-- invaderXim.effect.WARCRY
-- Notes:
-- Savagery TP bonus not cut in half like ffxclopedia says.
-- ffxiclopedia is wrong, bg wiki right. See link where testing was done.
-- http://www.bluegartr.com/threads/108199-Random-Facts-Thread-Other?p=5367464&viewfull=1#post5367464
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpLevel = target:getJobPointLevel(invaderXim.jp.WARCRY_EFFECT)
    local jpEffect = jpLevel * 3

    target:addMod(invaderXim.mod.ATTP, effect:getPower())
    target:addMod(invaderXim.mod.RATTP, effect:getPower())
    target:addMod(invaderXim.mod.TP_BONUS, effect:getSubPower())

    -- Job Point Bonus
    target:addMod(invaderXim.mod.ATT, jpEffect)
    target:addMod(invaderXim.mod.RATT, jpEffect)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpLevel = target:getJobPointLevel(invaderXim.jp.WARCRY_EFFECT)
    local jpEffect = jpLevel * 3

    target:delMod(invaderXim.mod.ATTP, effect:getPower())
    target:delMod(invaderXim.mod.RATTP, effect:getPower())
    target:delMod(invaderXim.mod.TP_BONUS, effect:getSubPower())

    -- Job Point Bonus
    target:delMod(invaderXim.mod.ATT, jpEffect)
    target:delMod(invaderXim.mod.RATT, jpEffect)
end

return effectObject
