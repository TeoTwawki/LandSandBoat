-----------------------------------
-- invaderXim.effect.AUSPICE
-- Power: Used for Enspell Effect
-- SubPower: Tracks Subtle Blow Bonus
-- Tier: Used for Enspell Calculation
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    -- Auspice Reduces TP via adding to your Subtle Blow Mod
    local subtleBlowBonus = 10 + target:getMod(invaderXim.mod.AUSPICE_EFFECT)

    effect:setSubPower(subtleBlowBonus)
    target:addMod(invaderXim.mod.SUBTLE_BLOW, subtleBlowBonus)

    -- Afflatus Misery Bonuses
    if target:hasStatusEffect(invaderXim.effect.AFFLATUS_MISERY) then
        target:getStatusEffect(invaderXim.effect.AFFLATUS_MISERY):setSubPower(0)
        target:addMod(invaderXim.mod.ENSPELL, 18)
        target:addMod(invaderXim.mod.ENSPELL_DMG, effect:getPower())
    end
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local subtleBlow = effect:getSubPower()

    target:delMod(invaderXim.mod.SUBTLE_BLOW, subtleBlow)

    -- Clean Up Any Bonuses That From Afflatus Misery Combo
    if target:hasStatusEffect(invaderXim.effect.AFFLATUS_MISERY) then
        local accuracyBonus = target:getStatusEffect(invaderXim.effect.AFFLATUS_MISERY):getSubPower()

        target:delMod(invaderXim.mod.ACC, accuracyBonus)
        target:getStatusEffect(invaderXim.effect.AFFLATUS_MISERY):setSubPower(0)

        target:setMod(invaderXim.mod.ENSPELL_DMG, 0)
        target:setMod(invaderXim.mod.ENSPELL, 0)
    end
end

return effectObject
