-----------------------------------
-- invaderXim.effect.AFFLATUS_SOLACE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AFFLATUS_SOLACE, 0)
    target:addMod(invaderXim.mod.BARSPELL_MDEF_BONUS, 5)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AFFLATUS_SOLACE, 0)
    target:delMod(invaderXim.mod.BARSPELL_MDEF_BONUS, 5)
end

return effectObject
