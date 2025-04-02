-----------------------------------
-- invaderXim.effect.PERFECT_DEFENSE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.UDMGPHYS, -effect:getPower())
    target:addMod(invaderXim.mod.UDMGBREATH, -effect:getPower())
    target:addMod(invaderXim.mod.UDMGMAGIC, -effect:getPower())
    target:addMod(invaderXim.mod.UDMGRANGE, -effect:getPower())
    target:addMod(invaderXim.mod.SLEEP_MEVA, effect:getPower())
    target:addMod(invaderXim.mod.POISON_MEVA, effect:getPower())
    target:addMod(invaderXim.mod.PARALYZE_MEVA, effect:getPower())
    target:addMod(invaderXim.mod.BLIND_MEVA, effect:getPower())
    target:addMod(invaderXim.mod.SILENCE_MEVA, effect:getPower())
    target:addMod(invaderXim.mod.BIND_MEVA, effect:getPower())
    target:addMod(invaderXim.mod.CURSE_MEVA, effect:getPower())
    target:addMod(invaderXim.mod.SLOW_MEVA, effect:getPower())
    target:addMod(invaderXim.mod.STUN_MEVA, effect:getPower())
    target:addMod(invaderXim.mod.CHARM_MEVA, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
    if effect:getTickCount() > ((effect:getDuration() / effect:getTick()) / 2) then
        if effect:getPower() > 2 then
            effect:setPower(effect:getPower() - 200)
            target:delMod(invaderXim.mod.UDMGPHYS, -200)
            target:delMod(invaderXim.mod.UDMGBREATH, -200)
            target:delMod(invaderXim.mod.UDMGMAGIC, -300)
            target:delMod(invaderXim.mod.UDMGRANGE, -200)
            target:delMod(invaderXim.mod.SLEEP_MEVA, 2)
            target:delMod(invaderXim.mod.POISON_MEVA, 2)
            target:delMod(invaderXim.mod.PARALYZE_MEVA, 2)
            target:delMod(invaderXim.mod.BLIND_MEVA, 2)
            target:delMod(invaderXim.mod.SILENCE_MEVA, 2)
            target:delMod(invaderXim.mod.BIND_MEVA, 2)
            target:delMod(invaderXim.mod.CURSE_MEVA, 2)
            target:delMod(invaderXim.mod.SLOW_MEVA, 2)
            target:delMod(invaderXim.mod.STUN_MEVA, 2)
            target:delMod(invaderXim.mod.CHARM_MEVA, 2)
        end
    end
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.UDMGPHYS, -effect:getPower())
    target:delMod(invaderXim.mod.UDMGBREATH, -effect:getPower())
    target:delMod(invaderXim.mod.UDMGMAGIC, -effect:getSubPower())
    target:delMod(invaderXim.mod.UDMGRANGE, -effect:getPower())
    target:delMod(invaderXim.mod.SLEEP_MEVA, effect:getPower())
    target:delMod(invaderXim.mod.POISON_MEVA, effect:getPower())
    target:delMod(invaderXim.mod.PARALYZE_MEVA, effect:getPower())
    target:delMod(invaderXim.mod.BLIND_MEVA, effect:getPower())
    target:delMod(invaderXim.mod.SILENCE_MEVA, effect:getPower())
    target:delMod(invaderXim.mod.BIND_MEVA, effect:getPower())
    target:delMod(invaderXim.mod.CURSE_MEVA, effect:getPower())
    target:delMod(invaderXim.mod.SLOW_MEVA, effect:getPower())
    target:delMod(invaderXim.mod.STUN_MEVA, effect:getPower())
    target:delMod(invaderXim.mod.CHARM_MEVA, effect:getPower())
end

return effectObject
