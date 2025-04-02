-----------------------------------
-- invaderXim.effect.DEBILITATION
-----------------------------------
---@type TEffect
local effectObject = {}

local statsBits =
{
    invaderXim.mod.STR,
    invaderXim.mod.DEX,
    invaderXim.mod.VIT,
    invaderXim.mod.AGI,
    invaderXim.mod.INT,
    invaderXim.mod.MND,
    invaderXim.mod.CHR,
    invaderXim.mod.HPP,
    invaderXim.mod.MPP
}

effectObject.onEffectGain = function(target, effect)
    local power = effect:getPower()
    for statbit, mod in ipairs(statsBits) do
        if bit.band(bit.lshift(1, statbit - 1), power) > 0 then
            if mod == invaderXim.mod.HPP or mod == invaderXim.mod.MPP then
                target:addMod(mod, -40)
            else
                target:addMod(mod, -30)
            end
        end
    end

    target:setStatDebilitation(power)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local power = effect:getPower()
    for statbit, mod in ipairs(statsBits) do
        if bit.band(bit.lshift(1, statbit - 1), power) > 0 then
            if mod == invaderXim.mod.HPP or mod == invaderXim.mod.MPP then
                target:delMod(mod, -40)
            else
                target:delMod(mod, -30)
            end
        end
    end

    target:setStatDebilitation(0)
end

return effectObject
