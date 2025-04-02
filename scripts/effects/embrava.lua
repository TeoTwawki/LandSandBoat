-----------------------------------
-- invaderXim.effect.EMBRAVA
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local skill = effect:getPower()
    local regen = math.floor(skill / 7) + 1
    local refresh = math.floor(skill / 100) + 1
    local haste = (math.floor(skill / 20) + 1) * 100

    target:addMod(invaderXim.mod.REGEN, regen)
    target:addMod(invaderXim.mod.REFRESH, refresh)
    target:addMod(invaderXim.mod.HASTE_MAGIC, haste)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local skill = effect:getPower()
    local regen = math.floor(skill / 7) + 1
    local refresh = math.floor(skill / 100) + 1
    local haste = (math.floor(skill / 20) + 1) * 100

    target:delMod(invaderXim.mod.REGEN, regen)
    target:delMod(invaderXim.mod.REFRESH, refresh)
    target:delMod(invaderXim.mod.HASTE_MAGIC, haste)
end

return effectObject
