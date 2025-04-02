-----------------------------------
-- invaderXim.effect.FROST
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local statReduction = (effect:getPower() - 1) * 2 + 5 -- Caster merits are included already.

    target:addMod(invaderXim.mod.REGEN_DOWN, effect:getPower())
    target:addMod(invaderXim.mod.AGI, -statReduction)

    target:delStatusEffect(invaderXim.effect.CHOKE)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local statReduction = (effect:getPower() - 1) * 2 + 5 -- Caster merits are included already.

    target:delMod(invaderXim.mod.REGEN_DOWN, effect:getPower())
    target:delMod(invaderXim.mod.AGI, -statReduction)
end

return effectObject
