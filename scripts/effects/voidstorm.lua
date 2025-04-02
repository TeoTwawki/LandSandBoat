-----------------------------------
-- invaderXim.effect.VOIDSTORM
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, math.floor(effect:getPower() / 2))
    target:addMod(invaderXim.mod.DEX, math.floor(effect:getPower() / 2))
    target:addMod(invaderXim.mod.VIT, math.floor(effect:getPower() / 2))
    target:addMod(invaderXim.mod.AGI, math.floor(effect:getPower() / 2))
    target:addMod(invaderXim.mod.INT, math.floor(effect:getPower() / 2))
    target:addMod(invaderXim.mod.MND, math.floor(effect:getPower() / 2))
    target:addMod(invaderXim.mod.CHR, math.floor(effect:getPower() / 2))
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, math.floor(effect:getPower() / 2))
    target:delMod(invaderXim.mod.DEX, math.floor(effect:getPower() / 2))
    target:delMod(invaderXim.mod.VIT, math.floor(effect:getPower() / 2))
    target:delMod(invaderXim.mod.AGI, math.floor(effect:getPower() / 2))
    target:delMod(invaderXim.mod.INT, math.floor(effect:getPower() / 2))
    target:delMod(invaderXim.mod.MND, math.floor(effect:getPower() / 2))
    target:delMod(invaderXim.mod.CHR, math.floor(effect:getPower() / 2))
end

return effectObject
