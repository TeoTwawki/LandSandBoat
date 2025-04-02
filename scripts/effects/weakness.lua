-----------------------------------
-- invaderXim.effect.WEAKNESS
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    --reduce HP and MP by the power amount. Add 100% slow
    --NOTE: The power amount dictates the amount to REDUCE MAX VALUES BY. E.g. Power=75 means 'reduce max hp/mp by 75%'
    target:addMod(invaderXim.mod.WEAKNESS_PCT, -75)

    -- 100% Slow -- FIXME: Weakness should probably be its own source of slow
    target:addMod(invaderXim.mod.HASTE_MAGIC, -10000)

    if effect:getPower() > 1 then
        -- handle double weakness
        target:addMod(invaderXim.mod.RACC, -999)
        target:addMod(invaderXim.mod.MATT, -999)
    end
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    --restore HP and MP to its former state. Remove 100% slow
    target:delMod(invaderXim.mod.WEAKNESS_PCT, -75)
    target:delMod(invaderXim.mod.HASTE_MAGIC, -10000)

    if effect:getPower() > 1 then
        -- handle double weakness
        target:delMod(invaderXim.mod.RACC, -999)
        target:delMod(invaderXim.mod.MATT, -999)
    end
end

return effectObject
