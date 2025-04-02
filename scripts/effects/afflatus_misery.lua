-----------------------------------
-- invaderXim.effect.AFFLATUS_MISERY
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:setMod(invaderXim.mod.AFFLATUS_MISERY, 0)

    if target:hasStatusEffect(invaderXim.effect.AUSPICE) then
        local power = target:getStatusEffect(invaderXim.effect.AUSPICE):getPower()
        target:addMod(invaderXim.mod.ENSPELL, 18)
        target:addMod(invaderXim.mod.ENSPELL_DMG, power)
    end
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:setMod(invaderXim.mod.AFFLATUS_MISERY, 0)

    --Clean Up Afflatus Misery Bonuses
    local accuracyBonus = effect:getSubPower()

    target:delMod(invaderXim.mod.ACC, accuracyBonus)

    if target:hasStatusEffect(invaderXim.effect.AUSPICE) then
        target:setMod(invaderXim.mod.ENSPELL, 0)
        target:setMod(invaderXim.mod.ENSPELL_DMG, 0)
    end
end

return effectObject
